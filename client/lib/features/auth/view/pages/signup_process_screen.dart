import 'package:client/features/auth/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupProcessScreen extends StatefulWidget{
  const SignupProcessScreen({super.key});

  @override
  State<SignupProcessScreen> createState() => _SignupProcessScreenState();
}

class _SignupProcessScreenState extends State<SignupProcessScreen>{
  final passwordRequirements = [
    "1 letter",
    "1 number or special character(example: !@#\$%)",
    "6 characters"
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create a password",
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Padding(padding: EdgeInsets.only(bottom: 8.0), child: Text("Password"),),
          const CustomTextField(),
          const SizedBox(height: 20,),
          Text("Your password must contain at least",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          ListView.builder(
            itemCount: passwordRequirements.length,
            itemBuilder: (context, index) {
              return Text(
                passwordRequirements[index],
                style: TextStyle(color: Colors.white, fontSize: 16),
              );
            },
          ),
          const SizedBox(height: 30,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle next action
              },
              child: const Text("Sign Up"),
            ),
          ),
        ],
      )
    );
  }
}