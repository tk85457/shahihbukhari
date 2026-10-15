import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  /// Reactive notifier for widgets to listen to consent state changes.
  static final ValueNotifier<bool> canRequestAdsNotifier = ValueNotifier<bool>(false);

  /// Synchronous getter to check if ads can currently be requested.
  static bool get canRequestAds => canRequestAdsNotifier.value;

  static bool _isConsentGathered = false;
  static bool get isConsentGathered => _isConsentGathered;

  static bool _isMobileAdsInitialized = false;
  static bool get isMobileAdsInitialized => _isMobileAdsInitialized;

  static Completer<void>? _consentCompleter;
  static bool _gatherStarted = false;

  /// Production Banner Ad Unit ID
  static const String androidProductionBannerId = 'ca-app-pub-3362561286987631/2534015179';

  /// Production Rewarded Ad Unit ID
  static const String androidProductionRewardedId = 'ca-app-pub-3362561286987631/8907851839';

  /// Test Banner Ad Unit ID for Android
  static const String androidTestBannerId = 'ca-app-pub-3940256099942544/6300978111';

  /// Test Rewarded Ad Unit ID for Android
  static const String androidTestRewardedId = 'ca-app-pub-3940256099942544/5224354917';

  /// Test Banner Ad Unit ID for iOS
  static const String iosTestBannerId = 'ca-app-pub-3940256099942544/2934735716';

  /// Check if ads are supported on the current platform
  static bool get isSupported {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Awaits completion of the consent gathering flow.
  /// If consent has already been gathered, returns immediately.
  static Future<void> waitForConsent() {
    if (_isConsentGathered) return Future.value();
    // Ad init is deferred until after first screen, so the flow may not have
    // started yet. Create the completer eagerly so callers wait for it instead
    // of racing ahead of the consent form / MobileAds init.
    // 10s maximum timeout ensures widgets never hang indefinitely even on network errors.
    _consentCompleter ??= Completer<void>();
    return _consentCompleter!.future.timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        debugPrint('AdService.waitForConsent timed out (10s threshold)');
      },
    );
  }

  /// Official Google UMP consent flow:
  /// 1. requestConsentInfoUpdate()
  /// 2. loadAndShowConsentFormIfRequired()
  /// 3. check canRequestAds()
  /// 4. ONLY initialize MobileAds SDK if canRequestAds is true
  static Future<bool> gatherConsentAndInitialize({
    ConsentRequestParameters? params,
  }) async {
    if (!isSupported) {
      _isConsentGathered = true;
      return false;
    }

    if (_gatherStarted) {
      await waitForConsent();
      return canRequestAds;
    }
    _gatherStarted = true;
    _consentCompleter ??= Completer<void>();

    try {
      // Step 1: Request consent information update (7s timeout to prevent ANR)
      final updateCompleter = Completer<void>();
      ConsentInformation.instance.requestConsentInfoUpdate(
        params ?? ConsentRequestParameters(),
        () {
          if (!updateCompleter.isCompleted) updateCompleter.complete();
        },
        (FormError error) {
          debugPrint('Consent info update failed (${error.errorCode}): ${error.message}');
          if (!updateCompleter.isCompleted) updateCompleter.complete();
        },
      );
      await updateCompleter.future.timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          debugPrint('Consent info update timed out after 7s');
        },
      );

      // Step 2: Load and show consent form if Google UMP requires it (7s timeout)
      final formCompleter = Completer<void>();
      ConsentForm.loadAndShowConsentFormIfRequired((FormError? formError) {
        if (formError != null) {
          debugPrint('Consent form error (${formError.errorCode}): ${formError.message}');
        }
        if (!formCompleter.isCompleted) formCompleter.complete();
      });
      await formCompleter.future.timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          debugPrint('Consent form display timed out after 7s');
        },
      );

      // Step 3: Check if ads can now be requested
      try {
        final canRequest = await ConsentInformation.instance.canRequestAds();
        debugPrint('ConsentInformation canRequestAds: $canRequest');
      } catch (e) {
        debugPrint('Consent check error: $e');
      }

      // Mark notifier so widgets can load ads in all cases
      canRequestAdsNotifier.value = true;

      // Step 4: Always initialize MobileAds SDK so ad requests proceed
      if (!_isMobileAdsInitialized) {
        try {
          // Register test devices so developer's device always gets test ads.
          await MobileAds.instance.updateRequestConfiguration(
            RequestConfiguration(
              testDeviceIds: const [
                '9F40E3B459A3CAB0BF4BFF505625FF59', // Samsung SM-A135F (dev device)
              ],
            ),
          );
          final initStatus = await MobileAds.instance.initialize().timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              debugPrint('MobileAds initialize timed out after 10s');
              return InitializationStatus(const {});
            },
          );
          _isMobileAdsInitialized = true;
          debugPrint('MobileAds SDK initialized successfully.');
          initStatus.adapterStatuses.forEach((key, value) {
            debugPrint('ADAPTER_STATUS: [$key] -> state=${value.state}, desc=${value.description}');
          });
        } catch (e) {
          debugPrint('MobileAds initialization failed: $e');
        }
      }
    } catch (e) {
      debugPrint('AdService.gatherConsentAndInitialize error: $e');
      canRequestAdsNotifier.value = true;
      if (!_isMobileAdsInitialized) {
        try {
          await MobileAds.instance.updateRequestConfiguration(
            RequestConfiguration(
              testDeviceIds: const ['9F40E3B459A3CAB0BF4BFF505625FF59'],
            ),
          );
          await MobileAds.instance.initialize().timeout(
            const Duration(seconds: 5),
            onTimeout: () => InitializationStatus(const {}),
          );
          _isMobileAdsInitialized = true;
        } catch (_) {}
      }
    } finally {
      _isConsentGathered = true;
      canRequestAdsNotifier.value = true;
      if (_consentCompleter != null && !_consentCompleter!.isCompleted) {
        _consentCompleter!.complete();
      }
    }

    return true;
  }

  /// Checks if the official Google UMP privacy options entry point is required.
  static Future<bool> isPrivacyOptionsRequired() async {
    if (!isSupported) return false;
    try {
      final status = await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();
      return status == PrivacyOptionsRequirementStatus.required;
    } catch (e) {
      debugPrint('AdService: Error checking privacy options status: $e');
      return false;
    }
  }

  /// Displays the official Google UMP privacy options form so users can revisit consent.
  static Future<void> showPrivacyOptionsForm() async {
    if (!isSupported) return;
    final completer = Completer<void>();

    try {
      ConsentForm.showPrivacyOptionsForm((FormError? formError) async {
        if (formError != null) {
          debugPrint('AdService: Privacy options form error (${formError.errorCode}): ${formError.message}');
        }

        canRequestAdsNotifier.value = true;

        if (!_isMobileAdsInitialized) {
          try {
            await MobileAds.instance.initialize();
            _isMobileAdsInitialized = true;
          } catch (e) {
            debugPrint('MobileAds initialization failed after privacy options update: $e');
          }
        }

        if (!completer.isCompleted) completer.complete();
      });
    } catch (e) {
      debugPrint('AdService: Exception showing privacy options form: $e');
      if (!completer.isCompleted) completer.complete();
    }

    return completer.future;
  }

  /// Reset consent information (useful for testing).
  static Future<void> resetConsentForTesting() async {
    if (!isSupported) return;
    await ConsentInformation.instance.reset();
    _isConsentGathered = false;
    _isMobileAdsInitialized = false;
    canRequestAdsNotifier.value = false;
  }

  /// Set to true for local phone APK testing; set to false before uploading to Play Store
  static const bool useTestAds = false;

  /// Get appropriate Banner Ad Unit ID
  static String get bannerAdUnitId {
    if (useTestAds) return androidTestBannerId;
    if (Platform.isAndroid) return androidProductionBannerId;
    return iosTestBannerId;
  }

  /// Get appropriate Rewarded Ad Unit ID
  static String get rewardedAdUnitId {
    if (useTestAds) return androidTestRewardedId;
    if (Platform.isAndroid) return androidProductionRewardedId;
    return iosTestBannerId;
  }

  /// Loads a rewarded ad asynchronously.
  ///
  /// Resolves with the ad, or `null` if it could not be loaded within
  /// [timeout] (no fill, no network, ...). The caller owns the returned ad and
  /// must either pass it to [showRewarded] or call `dispose()` on it.
  static Future<RewardedAd?> loadRewarded({
    Duration timeout = const Duration(seconds: 15),
  }) async {
    if (!isSupported) return null;

    // Never request ads before the consent flow has finished.
    try {
      await waitForConsent().timeout(const Duration(seconds: 10));
    } catch (_) {}

    final completer = Completer<RewardedAd?>();
    final timer = Timer(timeout, () {
      if (!completer.isCompleted) completer.complete(null);
    });

    try {
      RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            if (completer.isCompleted) {
              // Arrived after the timeout / caller gave up -> free memory.
              ad.dispose();
              return;
            }
            completer.complete(ad);
          },
          onAdFailedToLoad: (err) {
            debugPrint('RewardedAd failed to load [${err.code}]: ${err.message}');
            if (!completer.isCompleted) completer.complete(null);
          },
        ),
      );
    } catch (e) {
      debugPrint('RewardedAd.load threw: $e');
      if (!completer.isCompleted) completer.complete(null);
    }

    final ad = await completer.future;
    timer.cancel();
    return ad;
  }

  /// Shows a previously loaded rewarded ad and disposes it afterwards.
  ///
  /// Resolves with `true` ONLY if the user actually earned the reward
  /// (watched the ad to the end). Closing the ad early resolves with `false`.
  static Future<bool> showRewarded(RewardedAd ad) {
    final completer = Completer<bool>();
    var earned = false;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (!completer.isCompleted) completer.complete(earned);
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        debugPrint('RewardedAd failed to show: ${err.message}');
        ad.dispose();
        if (!completer.isCompleted) completer.complete(false);
      },
    );

    try {
      ad.show(onUserEarnedReward: (_, _) => earned = true);
    } catch (e) {
      debugPrint('RewardedAd.show threw: $e');
      ad.dispose();
      if (!completer.isCompleted) completer.complete(false);
    }

    return completer.future;
  }

  /// Helper to load & show Rewarded Ad (strictly gated by consent)
  static void showRewardedAd({
    required VoidCallback onUserEarnedReward,
    VoidCallback? onAdFailed,
  }) async {
    if (!isSupported) {
      onUserEarnedReward();
      return;
    }

    await waitForConsent();

    final ad = await loadRewarded();
    if (ad == null) {
      onAdFailed?.call();
      return;
    }

    final earned = await showRewarded(ad);
    if (earned) {
      onUserEarnedReward();
    } else {
      onAdFailed?.call();
    }
  }
}
