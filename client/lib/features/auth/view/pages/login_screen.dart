import 'package:muzic/constants/assets_constants.dart';
import 'package:muzic/core/screen_names.dart';
import 'package:muzic/core/services/auth_services.dart';
import 'package:muzic/features/auth/view/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome back',
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Email")),
                const CustomTextField(hintText: "name@domain.com"),
                const SizedBox(height: 20),
                const Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Password")),
                const CustomTextField(hintText: "Password"),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text("Continue")),
                ),
                const SizedBox(height: 20),
                Center(
                  child: const Text(
                    "or",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final authService = AuthService();
                      try {
                        final userCredential = await authService.signInWithGoogle();
                        if (!mounted) return;
                        if (userCredential != null) {
                          context.pushNamed(ScreenNames.signUpProcessScreen);
                        }
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(AssetsConstants.googleIconPng, width: 24, height: 24), const SizedBox(width: 10), const Text("Continue with Google")],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(ScreenNames.signUpScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
