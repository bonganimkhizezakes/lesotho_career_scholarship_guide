import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
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
        backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
        appBar: AppBar(
          backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.kPrimaryWhite,
            ),
          ),
          bottom: TabBar(
            indicatorColor: AppTheme.kAccentRed,
            labelColor: AppTheme.kAccentRed,
            unselectedLabelColor: AppTheme.kPrimaryWhite.withOpacity(0.6),
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