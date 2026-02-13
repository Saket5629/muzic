import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service to dynamically change the app launcher icon on Android.
///
/// Uses activity-alias approach where multiple launcher aliases are defined
/// in AndroidManifest.xml, each with a different icon. Only one alias is
/// enabled at a time.
///
/// Icon mapping:
/// - 1 = Default (launcher_icon)
/// - 2 = Diwali (launcher_diwali)
/// - 3 = Holi (launcher_holi)
///
/// IMPORTANT: Icon changes are applied on COLD START only to prevent
/// the app from being killed mid-session by some device launchers.
class AppIconService {
  static const MethodChannel _channel = MethodChannel('com.muzic.muzic/app_icon');

  static const String _pendingIconKey = 'pending_app_icon';
  static const String _currentIconKey = 'current_app_icon';

  /// Call this at app startup (before splash screen navigation).
  /// It checks if there's a pending icon change from the previous session
  /// and applies it now (at cold start, before user interaction).
  static Future<void> applyPendingIconChange() async {
    if (!Platform.isAndroid) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingIcon = prefs.getInt(_pendingIconKey);

      if (pendingIcon != null && pendingIcon >= 1 && pendingIcon <= 3) {
        final currentIcon = await getCurrentIcon();

        if (currentIcon != pendingIcon) {
          log('🔄 Applying pending icon change: $currentIcon → $pendingIcon');
          final success = await _changeAppIconNow(pendingIcon);
          if (success) {
            await prefs.setInt(_currentIconKey, pendingIcon);
            log('✅ Icon changed to $pendingIcon');
          }
        }

        // Clear the pending change (whether successful or not)
        await prefs.remove(_pendingIconKey);
      }
    } catch (e) {
      log('⚠️ Error applying pending icon change: $e');
    }
  }

  /// Schedule an icon change for the next cold start.
  /// This does NOT apply the change immediately (to prevent app being killed).
  ///
  /// [iconIndex]: 1 = Default, 2 = Sale, 3 = Diwali, 4 = Holi
  ///
  /// Returns `true` if the change was scheduled.
  static Future<bool> scheduleIconChange(int iconIndex) async {
    if (!Platform.isAndroid) return false;
    if (iconIndex < 1 || iconIndex > 3) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      final currentIcon = prefs.getInt(_currentIconKey) ?? 1;

      if (currentIcon == iconIndex) {
        log('✅ Icon is already set to $iconIndex, no change needed');
        return false;
      }

      await prefs.setInt(_pendingIconKey, iconIndex);
      log('📋 Scheduled icon change to $iconIndex (will apply on next launch)');
      return true;
    } catch (e) {
      log('⚠️ Failed to schedule icon change: $e');
      return false;
    }
  }

  /// Check if icon update is needed and schedule it for next launch.
  /// Use this when fetching from Remote Config.
  ///
  /// [newIconIndex]: The desired icon index from Firebase Remote Config
  ///
  /// Returns `true` if a change was scheduled.
  static Future<bool> updateIconIfNeeded(int newIconIndex) async {
    return await scheduleIconChange(newIconIndex);
  }

  /// Gets the currently active icon index from the system.
  static Future<int> getCurrentIcon() async {
    if (!Platform.isAndroid) return 1;

    try {
      final result = await _channel.invokeMethod('getCurrentIcon');
      return result as int? ?? 1;
    } on PlatformException catch (e) {
      log('Failed to get current icon: ${e.message}');
      return 1;
    }
  }

  /// Internal method to actually change the icon NOW via native code.
  /// Only called during cold start from [applyPendingIconChange].
  static Future<bool> _changeAppIconNow(int iconIndex) async {
    try {
      final result = await _channel.invokeMethod('changeAppIcon', {'iconIndex': iconIndex});
      return result == true;
    } on PlatformException catch (e) {
      log('Failed to change app icon: ${e.message}');
      return false;
    }
  }
}
