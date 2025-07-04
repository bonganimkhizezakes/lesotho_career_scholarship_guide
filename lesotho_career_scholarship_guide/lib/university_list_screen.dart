import 'package:flutter/material.dart';

class UniversityListScreen extends StatelessWidget {
  const UniversityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E117A), // Deep indigo background
      body: const Center(
        child: Text(
          'Universities List',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF8F9FA), // Off-white
          ),
        ),
      ),
    );
  }
}