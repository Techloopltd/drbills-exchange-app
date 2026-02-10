import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/router/dr_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = DrRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DrBills Exchange',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
