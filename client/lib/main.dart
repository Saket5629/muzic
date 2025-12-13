import 'dart:developer';

import 'package:client/core/app_routing_manager/app_routing_manager.dart';
import 'package:client/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    log('✅ Firebase initialized successfully!');
  } catch (e) {
    log('❌ Firebase initialization error: $e');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Muzic',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutingManager.goRouter,
    );
  }
}