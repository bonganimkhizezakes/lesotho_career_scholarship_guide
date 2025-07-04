import 'package:flutter/material.dart';
import 'career_list_screen.dart';
import 'university_list_screen.dart';
import 'scholarship_list_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF0E117A), // Deep indigo background
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E117A),
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF8F9FA), // Off-white
            ),
          ),
          bottom: TabBar(
            indicatorColor: const Color(0xFF12E2A4), // Vibrant mint
            labelColor: const Color(0xFF12E2A4), // Vibrant mint
            unselectedLabelColor: const Color(0xFF9CA3AF), // Muted gray
            labelStyle: const TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Careers'),
              Tab(text: 'Universities'),
              Tab(text: 'Scholarships'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CareerListScreen(),
            UniversityListScreen(),
            ScholarshipListScreen(),
          ],
        ),
      ),
    );
  }
}