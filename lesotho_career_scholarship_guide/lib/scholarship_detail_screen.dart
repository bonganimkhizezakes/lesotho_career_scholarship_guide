import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class ScholarshipDetailScreen extends StatelessWidget {
  final Map<String, dynamic> scholarship;

  const ScholarshipDetailScreen({
    Key? key,
    required this.scholarship,
  }) : super(key: key);

  // Helper for consistent section headings
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppTheme.kPrimaryWhite,
        ),
      ),
    );
  }

  // Helper for bulleted list items
  Widget _buildListItem(String text) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle_outline, color: AppTheme.kAccentRed, size: 20),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Nunito Sans',
          color: AppTheme.kPrimaryWhite.withOpacity(0.8),
          fontSize: 16,
          height: 1.4,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
        elevation: 0,
        title: Text(
          scholarship['name']!,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppTheme.kPrimaryWhite,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded, color: AppTheme.kPrimaryWhite),
            onPressed: () {
              // Placeholder for save functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Info Card
              Card(
                color: AppTheme.getCardColor(ScreenType.explore),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _InfoRow(icon: Icons.business_rounded, text: scholarship['provider']!),
                      Divider(height: 24, color: AppTheme.kPrimaryWhite.withOpacity(0.2)),
                      _InfoRow(icon: Icons.monetization_on_rounded, text: scholarship['value']!),
                      Divider(height: 24, color: AppTheme.kPrimaryWhite.withOpacity(0.2)),
                      _InfoRow(icon: Icons.today_rounded, text: scholarship['deadline']!),
                    ],
                  ),
                ),
              ),

              // About Section
              _buildSectionTitle('About the Scholarship'),
              Text(
                scholarship['description']!,
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              // Eligibility Section
              _buildSectionTitle('Eligibility Requirements'),
              Column(
                children: (scholarship['eligibility'] as List<String>)
                    .map((item) => _buildListItem(item))
                    .toList(),
              ),

              // Required Documents Section
              _buildSectionTitle('Required Documents'),
              Column(
                children: (scholarship['documents'] as List<String>)
                    .map((item) => _buildListItem(item))
                    .toList(),
              ),

              const SizedBox(height: 32),

              // Call-to-Action Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Placeholder for portal link
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.kAccentRed,
                    foregroundColor: AppTheme.kPrimaryWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Go to Application Portal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A private helper widget for the rows in the info card
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.kPrimaryWhite.withOpacity(0.8), size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Nunito Sans',
              color: AppTheme.kPrimaryWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}