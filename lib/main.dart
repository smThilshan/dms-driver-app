import 'package:dms_driver_app/common/app_router.dart';
import 'package:dms_driver_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Driver Management System - Driver App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // You can switch to system if needed
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
