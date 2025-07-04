import 'package:flutter/material.dart';
import 'career_detail_screen.dart'; // Import the new detail screen

class CareerListScreen extends StatelessWidget {
  const CareerListScreen({Key? key}) : super(key: key);

  // New grouped data structure
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

  // Get appropriate icon based on career field
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
      backgroundColor: const Color(0xFF0E117A), // Main indigo background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Search Bar (kept from previous version)
            TextField(
              style: const TextStyle(
                color: Color(0xFFF8F9FA), // Off-white text
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFF8F9FA), // Off-white icon
                ),
                hintText: 'Search for a career...',
                hintStyle: const TextStyle(
                  color: Color(0xFFF8F9FA), // Off-white hint
                ),
                filled: true,
                fillColor: const Color(0xFF1A1E8A), // Slightly lighter than main background
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
                    color: Color(0xFFF8F9FA),
                    width: 1.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Expandable List View
            Expanded(
              child: ListView.builder(
                itemCount: fieldKeys.length,
                itemBuilder: (context, index) {
                  final fieldName = fieldKeys[index];
                  final careers = placeholderCareerFields[fieldName]!;

                  return Card(
                    color: const Color(0xFF1A1E8A), // Slightly lighter than main background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      leading: Icon(
                        _getFieldIcon(fieldName),
                        color: const Color(0xFFF8F9FA), // Off-white icon
                        size: 24,
                      ),
                      title: Text(
                        fieldName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF8F9FA), // Off-white color
                          fontSize: 16,
                        ),
                      ),
                      iconColor: const Color(0xFFF8F9FA), // Off-white expand/collapse icon
                      collapsedIconColor: const Color(0xFFF8F9FA), // Off-white when collapsed
                      children: careers.map((careerName) {
                        return ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 72.0, // Indented look
                            right: 16.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          title: Text(
                            careerName,
                            style: const TextStyle(
                              fontFamily: 'Nunito Sans',
                              color: Color(0xFFB8BCC8), // Muted off-white color
                              fontSize: 14,
                            ),
                          ),
                          // --- NAVIGATION ADDED HERE ---
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
                      // NOTE: I have corrected an error here.
                      // The original code had a duplicated ".map((careerName) {...})" which would cause an error.
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