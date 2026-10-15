import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../core/ads/ad_free_service.dart';
import '../core/ads/ad_service.dart';
import '../theme/app_theme.dart';

/// Popup that lets the user choose:
///  * continue with banner ads, or
///  * watch ONE rewarded ad and get banner ads switched off for 24 hours.
///
/// The reward is granted only when the rewarded ad was watched to the end.
class AdChoiceDialog extends StatefulWidget {
  const AdChoiceDialog({super.key});

  /// Opens the right dialog: the choice dialog, or - when banners are already
  /// off - a small info dialog showing the remaining time.
  static Future<void> show(BuildContext context) async {
    if (AdFreeService.isAdFree) {
      return showDialog<void>(
        context: context,
        builder: (_) => const _AdFreeActiveDialog(),
      );
    }
    await showDialog<void>(
      context: context,
      builder: (_) => const AdChoiceDialog(),
    );
    await AdFreeService.markPromptShown();
  }

  @override
  State<AdChoiceDialog> createState() => _AdChoiceDialogState();
}

class _AdChoiceDialogState extends State<AdChoiceDialog> {
  RewardedAd? _ad;
  bool _isLoading = false;
  bool _isShowing = false;
  bool _userWantsToWatch = false;
  String? _note;

  @override
  void initState() {
    super.initState();
    // Preload while user reads dialog so ad opens instantly
    _loadAd();
  }

  @override
  void dispose() {
    _ad?.dispose();
    _ad = null;
    super.dispose();
  }

  Future<void> _loadAd() async {
    if (_isLoading || _ad != null) return;
    setState(() => _isLoading = true);

    final ad = await AdService.loadRewarded();

    if (!mounted) {
      ad?.dispose();
      return;
    }

    if (ad == null) {
      setState(() {
        _isLoading = false;
        _userWantsToWatch = false;
        _note =
            'Ad is not available right now. Please check your internet '
            'connection and try again, or continue with banner ads.';
      });
      return;
    }

    setState(() {
      _ad = ad;
      _isLoading = false;
    });

    if (_userWantsToWatch) {
      _showAd();
    }
  }

  void _onWatchTap() {
    if (_isShowing) return;
    HapticFeedback.lightImpact();

    if (_ad != null) {
      _showAd();
      return;
    }

    // Ad still loading: remember tap and retry
    setState(() {
      _userWantsToWatch = true;
      _note = null;
    });
    _loadAd();
  }

  Future<void> _showAd() async {
    final ad = _ad;
    if (ad == null || _isShowing) return;

    setState(() {
      _ad = null;
      _isShowing = true;
      _userWantsToWatch = false;
      _note = null;
    });

    final earned = await AdService.showRewarded(ad);

    if (earned) {
      await AdFreeService.grantAdFree();
      if (!mounted) return;
      final messenger = ScaffoldMessenger.maybeOf(context);
      Navigator.of(context).pop();
      messenger?.showSnackBar(
        const SnackBar(
          content: Text(
            'JazakAllah Khair! Banner ads are off for the next 24 hours. 💚',
          ),
          backgroundColor: Color(0xFF0A7E47),
          duration: Duration(seconds: 4),
        ),
      );
      return;
    }

    if (!mounted) return;
    setState(() {
      _isShowing = false;
      _note = 'Please watch the full ad to switch banner ads off.';
    });
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = const Color(0xFF0A7E47);
    final textColor = isDark ? Colors.white : AppTheme.textDark;
    final subColor = isDark ? Colors.grey.shade400 : Colors.grey.shade700;

    final busy = _isLoading || _isShowing;
    final String watchLabel = _isShowing
        ? 'Opening ad…'
        : _isLoading
        ? 'Loading ad…'
        : _note != null && _ad == null
        ? 'Try again'
        : 'Watch ad – no banners for 24 hours';

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.volunteer_activism,
                  color: Colors.amber,
                  size: 34,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Remove banner ads for 24 hours?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'This app is free and supported by ads. Watch one short ad and '
              'all banner ads will be switched off on this device for the next '
              '24 hours.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, height: 1.4, color: subColor),
            ),
            const SizedBox(height: 8),
            Text(
              'ایک مختصر اشتہار دیکھیں، اگلے 24 گھنٹے تک تمام بینر اشتہارات بند رہیں گے۔',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 13.5, height: 1.8, color: subColor),
            ),
            if (_note != null) ...[
              const SizedBox(height: 10),
              Text(
                _note!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.4,
                  color: Colors.orange.shade800,
                ),
              ),
            ],
            const SizedBox(height: 18),
            FilledButton(
              onPressed: _isShowing ? null : _onWatchTap,
              style: FilledButton.styleFrom(
                backgroundColor: primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (busy) ...[
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ] else ...[
                    const Icon(Icons.play_circle_fill_rounded, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      watchLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: _isShowing
                  ? null
                  : () {
                      AdFreeService.markPromptShown();
                      Navigator.of(context).pop();
                    },
              child: Text(
                'Continue with banner ads',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shown when the user taps the app-bar icon while banners are already off.
class _AdFreeActiveDialog extends StatelessWidget {
  const _AdFreeActiveDialog();

  String _format(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    if (h <= 0) return '${m <= 0 ? 1 : m} min';
    return '${h}h ${m}m';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: const Icon(
        Icons.verified_rounded,
        color: Color(0xFF0A7E47),
        size: 36,
      ),
      title: const Text(
        'Banner ads are off',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      content: Text(
        'Time left: ${_format(AdFreeService.remaining)}.\n'
        'JazakAllah Khair for supporting the app! The option will be offered '
        'again after this period.',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

/// Wrap the home screen with this. It checks the 12-hour schedule on app launch
/// and shows [AdChoiceDialog] without causing any freezes or ANRs.
class AdChoicePromptHost extends StatefulWidget {
  final Widget child;

  const AdChoicePromptHost({super.key, required this.child});

  @override
  State<AdChoicePromptHost> createState() => _AdChoicePromptHostState();
}

class _AdChoicePromptHostState extends State<AdChoicePromptHost> {
  static bool _checkedThisLaunch = false;

  @override
  void initState() {
    super.initState();
    if (!_checkedThisLaunch) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShow());
    }
  }

  Future<void> _maybeShow() async {
    if (_checkedThisLaunch || !mounted) return;
    _checkedThisLaunch = true;
    if (!AdService.isSupported) return;

    // Consent (UMP) must be finished before any ad related UI.
    try {
      await AdService.waitForConsent().timeout(const Duration(seconds: 10));
    } catch (_) {}

    AdFreeService.refresh();
    if (!mounted || !AdFreeService.shouldShowPrompt()) return;

    // Let the first frames settle so low-end phones don't stutter.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;

    await AdChoiceDialog.show(context);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
