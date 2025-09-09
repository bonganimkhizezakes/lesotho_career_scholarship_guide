import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class MyPlanScreen extends StatefulWidget {
  const MyPlanScreen({super.key});

  @override
  State<MyPlanScreen> createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  // Hardcoded data for the Resources tab
  final List<Map<String, dynamic>> placeholderResources = [
    {'title': 'Standard CV Template', 'icon': Icons.description_rounded},
    {'title': 'Cover Letter Guide', 'icon': Icons.description_rounded},
    {'title': 'Interview Preparation Checklist', 'icon': Icons.checklist_rounded},
    {'title': 'Personal Statement Examples', 'icon': Icons.description_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppTheme.getBackgroundColor(ScreenType.myPlan),
        appBar: AppBar(
          backgroundColor: AppTheme.getBackgroundColor(ScreenType.myPlan),
          elevation: 0,
          title: const Text(
            'My Plan',
            style: TextStyle(
              fontFamily: 'Poppins',
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
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(text: 'Saved Items'),
              Tab(text: 'Test Results'),
              Tab(text: 'Resources'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSavedItemsTab(),
            _buildTestResultsTab(),
            _buildResourcesTab(),
          ],
        ),
      ),
    );
  }

  // Widget for the "Saved Items" tab content
  Widget _buildSavedItemsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSavedCategoryTile(
          title: 'Saved Careers',
          icon: Icons.work_rounded,
          items: ['Software Engineer', 'Data Scientist'],
        ),
        _buildSavedCategoryTile(
          title: 'Saved Universities',
          icon: Icons.school_rounded,
          items: ['National University of Lesotho', 'University of Cape Town'],
        ),
        _buildSavedCategoryTile(
          title: 'Saved Scholarships',
          icon: Icons.card_giftcard_rounded,
          items: ['Chevening Scholarships', 'Standard Bank Group Scholarship'],
        ),
      ],
    );
  }

  // Widget for the "Test Results" tab content
  Widget _buildTestResultsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: AppTheme.getCardColor(ScreenType.myPlan),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Personality Type: The Analyst',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppTheme.kPrimaryWhite,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'As an Analyst, you are rational, impartial, and excel at intellectual pursuits. You are driven by a desire for knowledge and are a strategic thinker, capable of tackling complex problems with logic and creativity.',
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.kAccentRed,
                  foregroundColor: AppTheme.kPrimaryWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'View Recommended Careers',
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the "Resources" tab content
  Widget _buildResourcesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: placeholderResources.length,
      itemBuilder: (context, index) {
        final resource = placeholderResources[index];
        return Card(
          color: AppTheme.getCardColor(ScreenType.myPlan),
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Icon(resource['icon'], color: AppTheme.kPrimaryWhite.withOpacity(0.8)),
            title: Text(
              resource['title'],
              style: const TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: AppTheme.kPrimaryWhite,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.download_rounded, color: AppTheme.kAccentRed),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  // Helper widget to build the expandable tiles for the "Saved Items" tab
  Widget _buildSavedCategoryTile({
    required String title,
    required IconData icon,
    required List<String> items,
  }) {
    return Card(
      color: AppTheme.getCardColor(ScreenType.myPlan),
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(icon, color: AppTheme.kAccentRed),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppTheme.kPrimaryWhite,
          ),
        ),
        iconColor: AppTheme.kPrimaryWhite,
        collapsedIconColor: AppTheme.kPrimaryWhite,
        children: items.map((item) {
          return ListTile(
            title: Text(
              item,
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 72, right: 16),
          );
        }).toList(),
      ),
    );
  }
}