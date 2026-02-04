import 'package:flutter/material.dart';
import 'package:muzic/core/screen_names.dart';
import 'package:muzic/features/auth/view/pages/login_screen.dart';
import 'package:muzic/features/auth/view/pages/signup_process_screen.dart';
import 'package:muzic/features/auth/view/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:muzic/view/splash/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

const String initRouteLocation = '/${ScreenNames.splashScreen}';

class AppRoutingManager {
  static final GoRouter goRouter = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: initRouteLocation,
    routes: [
      GoRoute(
        path: "/${ScreenNames.splashScreen}",
        name: ScreenNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/${ScreenNames.loginScreen}",
        name: ScreenNames.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/${ScreenNames.signUpScreen}",
        name: ScreenNames.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: "/${ScreenNames.signUpProcessScreen}",
        name: ScreenNames.signUpProcessScreen,
        builder: (context, state) => const SignupProcessScreen(),
      ),
    ],
  );
}
