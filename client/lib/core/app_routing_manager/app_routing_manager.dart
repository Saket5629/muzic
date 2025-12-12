
import 'package:client/core/screen_names.dart';
import 'package:client/features/auth/view/pages/login_screen.dart';
import 'package:client/features/auth/view/pages/signup_process_screen.dart';
import 'package:client/features/auth/view/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutingManager {
  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: ScreenNames.loginScreen,
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: ScreenNames.signUpScreen,
        path: "/${ScreenNames.signUpScreen}",
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: ScreenNames.signUpProcessScreen,
        path: "/${ScreenNames.signUpProcessScreen}",
        builder: (context, state) => const SignupProcessScreen(),
      ),
    ],
  );
}
