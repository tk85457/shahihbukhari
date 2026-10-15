import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tracks the "banner ads off for 24 hours" reward and the 12-hour popup schedule.
///
/// Everything is stored locally in SharedPreferences (no network, no extra SDK),
/// so it is cheap on low-end devices and works offline with zero crash risk.
///
/// Tamper protection (best effort, no server clock available):
///  * the reward window can never be longer than [adFreeDuration] from "now",
///    so moving the phone clock backwards does not extend it;
///  * a window that starts in the future (clock moved back) is ignored.
class AdFreeService {
  AdFreeService._();

  /// How long banner ads stay off after a rewarded ad is completed.
  static const Duration adFreeDuration = Duration(hours: 24);

  /// Minimum gap between two popups when user does not watch the video ad (12 hours).
  static const Duration promptInterval = Duration(hours: 12);

  /// Tolerance for small clock adjustments (NTP sync, timezone change, etc.).
  static const Duration _clockTolerance = Duration(minutes: 5);

  static const String _kStart = 'adfree_start_ms';
  static const String _kUntil = 'adfree_until_ms';
  static const String _kLastPrompt = 'adfree_last_prompt_ms';

  /// `true` while banner ads must NOT be requested or shown.
  static final ValueNotifier<bool> adFreeNotifier = ValueNotifier<bool>(false);

  static SharedPreferences? _prefs;
  static int _startMs = 0;
  static int _untilMs = 0;
  static int _lastPromptMs = 0;
  static Timer? _expiryTimer;

  static int get _nowMs => DateTime.now().millisecondsSinceEpoch;

  /// Loads the saved state. Call once from `_Bootstrap` or `main()` before `runApp`.
  static void init(SharedPreferences prefs) {
    _prefs = prefs;
    try {
      _startMs = prefs.getInt(_kStart) ?? 0;
      _untilMs = prefs.getInt(_kUntil) ?? 0;
      _lastPromptMs = prefs.getInt(_kLastPrompt) ?? 0;
    } catch (e) {
      debugPrint('AdFreeService.init read error: $e');
      _startMs = 0;
      _untilMs = 0;
      _lastPromptMs = 0;
    }
    refresh();
  }

  static bool _computeActive(int now) {
    if (_untilMs <= now) return false; // expired / never granted
    if (now < _startMs - _clockTolerance.inMilliseconds) {
      return false; // clock moved back before the window started
    }
    if (_untilMs - now > (adFreeDuration + _clockTolerance).inMilliseconds) {
      return false; // window longer than allowed -> clock was moved back
    }
    return true;
  }

  /// Whether banner ads are currently switched off.
  static bool get isAdFree => _computeActive(_nowMs);

  /// Time left in the current ad-free window (zero when not active).
  static Duration get remaining {
    final now = _nowMs;
    if (!_computeActive(now)) return Duration.zero;
    return Duration(milliseconds: _untilMs - now);
  }

  /// Recomputes the state, updates listeners and re-arms the expiry timer.
  /// Safe to call often (e.g. on app resume).
  static void refresh() {
    final active = isAdFree;
    _expiryTimer?.cancel();
    _expiryTimer = null;

    if (active) {
      _expiryTimer = Timer(remaining + const Duration(seconds: 1), refresh);
    }
    if (adFreeNotifier.value != active) {
      adFreeNotifier.value = active;
    }
  }

  /// Called after the user fully watched the rewarded ad.
  static Future<void> grantAdFree() async {
    final now = _nowMs;
    _startMs = now;
    _untilMs = now + adFreeDuration.inMilliseconds;
    _lastPromptMs = now;
    refresh();
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      _prefs = prefs;
      await prefs.setInt(_kStart, _startMs);
      await prefs.setInt(_kUntil, _untilMs);
      await prefs.setInt(_kLastPrompt, _lastPromptMs);
    } catch (e) {
      debugPrint('AdFreeService.grantAdFree persist error: $e');
    }
  }

  /// `true` when the rewarded-ad / banner choice popup must be shown.
  ///
  /// Rule:
  /// - If 24 h ad-free window is active -> do NOT show.
  /// - If user did not watch / dismissed previously -> show only after 12 hours have passed.
  static bool shouldShowPrompt() {
    final now = _nowMs;
    if (_computeActive(now)) return false;
    if (_lastPromptMs <= 0) return true; // First time ever
    return (now - _lastPromptMs) >= promptInterval.inMilliseconds;
  }

  /// Records that the popup was shown / dismissed (starts the 12-hour cooldown).
  static Future<void> markPromptShown() async {
    _lastPromptMs = _nowMs;
    try {
      final prefs = _prefs ?? await SharedPreferences.getInstance();
      _prefs = prefs;
      await prefs.setInt(_kLastPrompt, _lastPromptMs);
    } catch (e) {
      debugPrint('AdFreeService.markPromptShown persist error: $e');
    }
  }
}
