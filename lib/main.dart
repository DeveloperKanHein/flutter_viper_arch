import 'package:flutter/material.dart';
import 'package:viper_arch/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouter.getRoutes(context),
      initialRoute: AppRouter.initialRoute,
    );
  }
}
