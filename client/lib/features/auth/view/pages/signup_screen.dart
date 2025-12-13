import 'package:client/constants/assets_constants.dart';
import 'package:client/core/screen_names.dart';
import 'package:client/core/services/auth_services.dart';
import 'package:client/features/auth/view/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
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
                  child: ElevatedButton(onPressed: () async {
                    final authService = AuthService();
                    try {
                      final userCredential = await authService.signInWithGoogle();
                      if (!mounted) return;
                      if (userCredential != null) {
                        //
                        context.pushNamed(ScreenNames.signUpProcessScreen);
                      }
                    }
                    catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign in failed: $e')),
                      );
                    }
                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsConstants.googleIconPng, width: 24, height: 24),
                      const SizedBox(width: 10,),
                      const Text("Sign up with Google"),
                    ],
                  )),
                ),
                const SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(ScreenNames.loginScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Log in",
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
