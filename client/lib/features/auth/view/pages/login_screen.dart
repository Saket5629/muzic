import 'package:client/core/screen_names.dart';
import 'package:client/features/auth/view/widgets/custom_text_field.dart';
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
                const Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Email or username")),
                const CustomTextField(),
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
                  child: ElevatedButton(onPressed: () {}, child: const Text("Continue with Google")),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(ScreenNames.signUpScreen);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
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
