import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzic/core/app_routing_manager/app_routing_manager.dart';
import 'package:muzic/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:muzic/features/resources/repositories/player_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PlayerCubit>(
          create: (_) => PlayerCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Muzic', theme: AppTheme.darkTheme, debugShowCheckedModeBanner: false, routerConfig: AppRoutingManager.goRouter);
  }
}
