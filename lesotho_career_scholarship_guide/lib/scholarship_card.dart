import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class ScholarshipCard extends StatelessWidget {
  final String name;
  final String deadline;
  final String field;
  final String location;

  const ScholarshipCard({
    Key? key,
    required this.name,
    required this.deadline,
    required this.field,
    required this.location,
  }) : super(key: key);

  // Helper widget to build the detail rows consistently
  Widget _buildDetailRow(BuildContext context, {required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.kPrimaryWhite.withOpacity(0.8), size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              color: AppTheme.kPrimaryWhite.withOpacity(0.8),
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.getCardColor(ScreenType.explore), // Use theme-aware card color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row for Name and Deadline
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppTheme.kPrimaryWhite, // Primary text color
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  deadline,
                  style: const TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w800,
                    color: AppTheme.kAccentRed, // Accent color for deadline
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: AppTheme.kPrimaryWhite.withOpacity(0.2)), // Subtle divider
            const SizedBox(height: 12),
            // Bottom details for Field and Location
            Column(
              children: [
                _buildDetailRow(context, icon: Icons.science_rounded, text: field),
                const SizedBox(height: 8),
                _buildDetailRow(context, icon: Icons.public_rounded, text: location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}