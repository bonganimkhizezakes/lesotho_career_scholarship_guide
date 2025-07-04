import 'package:flutter/material.dart';
// 1. Change the import to your new main app shell.
import 'main_app_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Preview',
      // 2. Change the home widget to MainAppShell.
      home: const MainAppShell(),
    );
  }
}