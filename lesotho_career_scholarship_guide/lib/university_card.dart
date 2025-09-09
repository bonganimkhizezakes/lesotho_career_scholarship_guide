import 'package:flutter/material.dart';

class UniversityCard extends StatelessWidget {
  final String name;
  final String location;

  const UniversityCard({
    Key? key,
    required this.name,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: const Color(0xFF4A5BC4), // Slightly lighter than main indigo
      child: ListTile(
        leading: const Icon(
          Icons.school_rounded,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          location,
          style: const TextStyle(
            fontFamily: 'Nunito Sans',
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }
}