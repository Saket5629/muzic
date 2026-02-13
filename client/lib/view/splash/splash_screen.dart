import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzic/constants/assets_constants.dart';
import 'package:muzic/constants/theme_constants.dart';
import 'package:muzic/core/screen_names.dart';
import 'package:muzic/core/services/app_icon_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _intializeApp();
  }

  void _intializeApp() async {
    try {
      await Firebase.initializeApp();
      log('✅ Firebase initialized successfully!');

      // STEP 1: Apply any pending icon change from previous session
      // This happens at cold start, so it's safe to change the icon now
      await AppIconService.applyPendingIconChange();

      // STEP 2: Fetch new icon config from Remote Config
      // This will SCHEDULE a change for the NEXT launch (not immediate)
      await _checkAndUpdateAppIcon();
    } catch (e) {
      log('❌ Firebase initialization error: $e');
    }

    // Wait for splash animation
    await Future.delayed(const Duration(milliseconds: 1000));
    // Check if the widget is still mounted (good practice)
    if (!mounted) return;
    context.goNamed(ScreenNames.loginScreen);
  }

  /// Fetches the showIcon value from Firebase Remote Config
  /// and SCHEDULES the app icon change for the NEXT launch.
  /// This does NOT change the icon immediately (to prevent app crashes).
  /// Icon mapping: 1 = Default, 2 = Sale, 3 = Diwali
  Future<void> _checkAndUpdateAppIcon() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;

      // Set default values
      await remoteConfig.setDefaults({
        'showIcon': 1, // Default icon
      });

      // Configure settings for fetching
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(hours: 1), // Cache for 1 hour
        ),
      );

      // Fetch and activate remote config
      await remoteConfig.fetchAndActivate();

      // Get the icon index from remote config
      final showIcon = remoteConfig.getInt('showIcon');
      log('🎨 Remote Config showIcon value: $showIcon');

      // Schedule app icon change for NEXT launch (not immediate)
      final wasScheduled = await AppIconService.updateIconIfNeeded(showIcon);
      if (wasScheduled) {
        log('📋 Icon change to $showIcon scheduled for next app launch');
      } else {
        log('✅ App icon is already set to $showIcon');
      }
    } catch (e) {
      log('⚠️ Failed to fetch app icon config: $e');
      // Don't block app launch if remote config fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ThemeConstants.foregroundColor,
          image: DecorationImage(image: AssetImage(AssetsConstants.splashLogo)),
        ),
      ),
    );
  }
}
