import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../core/ads/ad_free_service.dart';
import '../core/ads/ad_service.dart';

/// Production-ready banner ad widget.
///
/// Features:
/// - Supports 24-hour ad-free reward (AdFreeService)
/// - Adaptive banner size (better CPM than fixed 320×50)
/// - Smart backoff retry: 15s → 30s → 60s
/// - Zero UI impact when no ad or when ad-free — returns SizedBox.shrink()
/// - Properly disposes ad on widget removal or reward activation (low memory)
/// - Pauses retry when app is backgrounded
/// - Safe against mount/unmount races
class BannerAdWidget extends StatefulWidget {
  /// Override the ad unit ID (leave null to use AdService default).
  final String? adUnitId;

  const BannerAdWidget({super.key, this.adUnitId});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget>
    with WidgetsBindingObserver {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  bool _isLoadingAd = false;
  Timer? _retryTimer;
  int _retryAttempt = 0;

  // Cached adaptive size — resolved once per widget instance.
  AdSize? _resolvedSize;

  // ─── Lifecycle ────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AdService.canRequestAdsNotifier.addListener(_onConsentChanged);
    AdFreeService.adFreeNotifier.addListener(_onAdFreeChanged);
    _checkConsentAndLoad();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // Pause retries while app is in background — saves battery / network.
      _retryTimer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      // Check if 24h ad-free state changed while app was backgrounded
      AdFreeService.refresh();
      if (AdFreeService.isAdFree) return;

      // Resume: request a fresh ad if none is showing.
      if (!_isAdLoaded || _bannerAd == null) {
        _retryAttempt = 0;
        _loadAd();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _retryTimer?.cancel();
    AdService.canRequestAdsNotifier.removeListener(_onConsentChanged);
    AdFreeService.adFreeNotifier.removeListener(_onAdFreeChanged);
    _bannerAd?.dispose();
    super.dispose();
  }

  // ─── Ad-free reward ───────────────────────────────────────────────────────

  /// Fires when the 24 h "banner ads off" window starts or ends.
  void _onAdFreeChanged() {
    if (!mounted) return;

    if (AdFreeService.adFreeNotifier.value) {
      // Reward granted: stop everything and free the ad's memory immediately.
      _retryTimer?.cancel();
      _retryTimer = null;
      final old = _bannerAd;
      setState(() {
        _bannerAd = null;
        _isAdLoaded = false;
        _isLoadingAd = false;
      });
      old?.dispose();
    } else {
      // Reward expired: resume loading ads if needed.
      if (_bannerAd == null && !_isLoadingAd) {
        _retryAttempt = 0;
        _loadAd();
      }
    }
  }

  // ─── Consent & Load ───────────────────────────────────────────────────────

  /// Fires when AdService consent state changes (e.g. UMP form completed).
  void _onConsentChanged() {
    if (!mounted) return;
    // Only react once the whole consent + SDK init flow has FINISHED, so the
    // first banner request never overlaps with MobileAds.initialize().
    if (AdService.isConsentGathered) {
      _scheduleFirstLoad();
    }
  }

  bool _firstLoadScheduled = false;

  /// ANR FIX: first banner request is delayed a little after SDK init so the
  /// main thread is not hit by init + AdView creation + first touch at once.
  void _scheduleFirstLoad() {
    if (_firstLoadScheduled || _bannerAd != null || _isAdLoaded) return;
    _firstLoadScheduled = true;
    _retryTimer?.cancel();
    _retryTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted && !_isAdLoaded && !_isLoadingAd) {
        _loadAd();
      }
    });
  }

  /// Entry point called from initState — waits for consent then loads.
  Future<void> _checkConsentAndLoad() async {
    if (!AdService.isSupported) return;
    if (!AdService.isConsentGathered) {
      await AdService.waitForConsent();
      if (!mounted) return;
    }
    _scheduleFirstLoad();
  }

  /// Resolves adaptive banner size once, then creates and loads the BannerAd.
  Future<void> _loadAd() async {
    if (!AdService.isSupported || _isLoadingAd || AdFreeService.isAdFree) return;
    _isLoadingAd = true;
    _retryTimer?.cancel();

    // Resolve adaptive size once per widget instance (cached).
    if (_resolvedSize == null && mounted) {
      final screenWidth = MediaQuery.of(context).size.width.truncate();
      final adaptive = await AdSize
          .getCurrentOrientationAnchoredAdaptiveBannerAdSize(screenWidth);
      // Fallback to standard banner if platform call fails.
      _resolvedSize = adaptive ?? AdSize.banner;
    }

    if (!mounted) {
      _isLoadingAd = false;
      return;
    }

    final unitId = widget.adUnitId ?? AdService.bannerAdUnitId;
    final size = _resolvedSize ?? AdSize.banner;

    try {
      BannerAd(
        adUnitId: unitId,
        request: const AdRequest(),
        size: size,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            if (!mounted) {
              ad.dispose();
              return;
            }
            final old = _bannerAd;
            setState(() {
              _bannerAd = ad as BannerAd;
              _isAdLoaded = true;
              _isLoadingAd = false;
            });
            old?.dispose();

            // Rule: Jab ad fill ho jaye, toh saara retry completely BAND!
            _retryAttempt = 0;
            _retryTimer?.cancel();
            _retryTimer = null;
          },
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd ($unitId) failed [${err.code}]: ${err.message}');
            ad.dispose();
            if (!mounted) return;
            _isLoadingAd = false;

            // Agar pehle se koi ad visible hai, usse rehne dein
            if (_bannerAd != null && _isAdLoaded) return;

            setState(() {
              _isAdLoaded = false;
              _bannerAd = null;
            });

            // Rule: Agar ad na dikhe ya no-fill ho, toh 5 second baad retry kare
            _scheduleRetry();
          },
        ),
      ).load();
    } catch (e) {
      debugPrint('Exception creating/loading BannerAd ($unitId): $e');
      if (mounted) {
        setState(() {
          _isLoadingAd = false;
          _isAdLoaded = false;
          _bannerAd = null;
        });
        _scheduleRetry();
      }
    }
  }

  /// Exponential backoff retry: 15s -> 30s -> 60s (prevents ad network rate-limiting)
  void _scheduleRetry() {
    _retryTimer?.cancel();
    if (_isAdLoaded && _bannerAd != null) return;

    _retryAttempt++;
    final delaySeconds = _retryAttempt == 1 ? 15 : (_retryAttempt == 2 ? 30 : 60);
    debugPrint('BannerAd retry #$_retryAttempt scheduled in ${delaySeconds}s...');
    _retryTimer = Timer(Duration(seconds: delaySeconds), () {
      if (mounted && !_isAdLoaded) {
        _loadAd();
      }
    });
  }

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // Return zero-size widget while loading, when no fill, or when 24h ad-free is active.
    if (!AdService.isSupported || AdFreeService.isAdFree || !_isAdLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      top: false,
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(
          key: ValueKey(_bannerAd.hashCode),
          ad: _bannerAd!,
        ),
      ),
    );
  }
}
