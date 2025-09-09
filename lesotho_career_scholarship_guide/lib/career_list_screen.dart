import 'package:flutter/material.dart';
import 'career_detail_screen.dart';
import 'theme/app_theme.dart';

class CareerListScreen extends StatelessWidget {
  const CareerListScreen({Key? key}) : super(key: key);

  final Map<String, List<String>> placeholderCareerFields = const {
    'Technology': [
      'Software Engineer',
      'Data Scientist',
      'UX/UI Designer',
      'Cybersecurity Analyst',
    ],
    'Healthcare': [
      'Medical Doctor',
      'Registered Nurse',
      'Pharmacist',
      'Physiotherapist',
    ],
    'Creative Arts': [
      'Graphic Designer',
      'Filmmaker',
      'Musician',
      'Writer',
    ],
    'Finance & Business': [
      'Accountant',
      'Marketing Manager',
      'Financial Analyst',
      'Human Resources Manager',
    ],
  };

  IconData _getFieldIcon(String field) {
    switch (field.toLowerCase()) {
      case 'technology':
        return Icons.computer_rounded;
      case 'healthcare':
        return Icons.health_and_safety_rounded;
      case 'creative arts':
        return Icons.palette_rounded;
      case 'finance & business':
        return Icons.business_rounded;
      default:
        return Icons.work_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fieldKeys = placeholderCareerFields.keys.toList();

    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            TextField(
              style: const TextStyle(
                color: AppTheme.kPrimaryWhite,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.kPrimaryWhite,
                ),
                hintText: 'Search for a career...',
                hintStyle: TextStyle(
                  color: AppTheme.kPrimaryWhite.withOpacity(0.6),
                ),
                filled: true,
                fillColor: AppTheme.getCardColor(ScreenType.explore),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: AppTheme.kAccentRed,
                    width: 1.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: fieldKeys.length,
                itemBuilder: (context, index) {
                  final fieldName = fieldKeys[index];
                  final careers = placeholderCareerFields[fieldName]!;

                  return Card(
                    color: AppTheme.getCardColor(ScreenType.explore),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      leading: Icon(
                        _getFieldIcon(fieldName),
                        color: AppTheme.kAccentRed,
                        size: 24,
                      ),
                      title: Text(
                        fieldName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: AppTheme.kPrimaryWhite,
                          fontSize: 16,
                        ),
                      ),
                      iconColor: AppTheme.kPrimaryWhite,
                      collapsedIconColor: AppTheme.kPrimaryWhite,
                      children: careers.map((careerName) {
                        return ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 72.0,
                            right: 16.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          title: Text(
                            careerName,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CareerDetailScreen(
                                  careerName: careerName,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
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