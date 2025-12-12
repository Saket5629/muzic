import 'package:client/core/screen_names.dart';
import 'package:client/features/auth/view/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign up to start listening',
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Username")),
                const CustomTextField(hintText: "Enter your username"),
                const SizedBox(height: 10),
                const Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Email address")),
                const CustomTextField(hintText: "name@domain.com"),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(ScreenNames.signUpProcessScreen);
                    },
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "or",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text("Sign up with Google")),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Text("Already have an account? ", style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(ScreenNames.loginScreen);
                        },
                        child: const Text(
                          "Log in",
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
