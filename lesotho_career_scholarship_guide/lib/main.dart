import 'package:flutter/material.dart';
import 'package:lesotho_career_scholarship_guide/main_app_shell.dart';
import 'package:lesotho_career_scholarship_guide/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lesotho Career Guide',

      // --- CHANGE THIS LINE ---
      theme: AppTheme.darkTheme, // Switched from lightTheme to darkTheme

      home: const MainAppShell(),
    );
  }
}