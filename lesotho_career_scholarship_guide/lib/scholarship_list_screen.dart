import 'package:flutter/material.dart';
import 'scholarship_card.dart';
import 'scholarship_detail_screen.dart'; // Import the new detail screen
import 'theme/app_theme.dart';

class ScholarshipListScreen extends StatelessWidget {
  const ScholarshipListScreen({Key? key}) : super(key: key);

  // --- UPDATED: Data structure now includes all details ---
  final List<Map<String, dynamic>> placeholderScholarships = const [
    {
      'name': 'Standard Bank Group Scholarship',
      'deadline': 'Sep 30, 2025',
      'field': 'Commerce, STEM',
      'location': 'South Africa',
      'provider': 'Standard Bank',
      'value': 'Full Tuition & Stipend',
      'description': 'A prestigious scholarship for high-achieving undergraduate students in commerce, science, engineering, and technology fields.',
      'eligibility': [
        'Must be a citizen of Lesotho',
        'Proven financial need',
        'Excellent academic results (A/B average)',
        'Enrolling in a full-time undergraduate degree',
      ],
      'documents': [
        'Certified copy of passport',
        'Academic transcripts',
        'Proof of admission',
        'Two letters of recommendation',
      ],
    },
    {
      'name': 'Chevening Scholarships',
      'deadline': 'Nov 7, 2025',
      'field': 'Any Field',
      'location': 'United Kingdom',
      'provider': 'UK Government',
      'value': 'Varies (Covers flights, accommodation, and course fees)',
      'description': 'The UK government’s international scholarships programme aimed at developing global leaders.',
      'eligibility': [
        'Have an undergraduate degree',
        'Have at least two years of work experience',
        'Meet the Chevening English language requirement',
      ],
      'documents': [
        'Valid passport/ID card',
        'University transcripts and degree certificates',
        'Three UK master\'s course choices',
      ],
    },
    // Add other scholarships here if needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: AppTheme.kPrimaryWhite),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: AppTheme.kPrimaryWhite),
                      hintText: 'Search for a scholarship...',
                      hintStyle: TextStyle(color: AppTheme.kPrimaryWhite.withOpacity(0.6)),
                      filled: true,
                      fillColor: AppTheme.getCardColor(ScreenType.explore),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: AppTheme.kAccentRed, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.filter_list_rounded),
                  color: AppTheme.kAccentRed,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: placeholderScholarships.length,
                itemBuilder: (context, index) {
                  final scholarship = placeholderScholarships[index];
                  // --- NAVIGATION ADDED HERE ---
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScholarshipDetailScreen(
                            scholarship: scholarship,
                          ),
                        ),
                      );
                    },
                    child: ScholarshipCard(
                      name: scholarship['name']!,
                      deadline: scholarship['deadline']!,
                      field: scholarship['field']!,
                      location: scholarship['location']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}