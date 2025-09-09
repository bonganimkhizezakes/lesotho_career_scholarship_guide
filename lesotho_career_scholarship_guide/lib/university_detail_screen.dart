import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class UniversityDetailScreen extends StatefulWidget {
  final String universityName;

  const UniversityDetailScreen({
    Key? key,
    required this.universityName,
  }) : super(key: key);

  @override
  State<UniversityDetailScreen> createState() => _UniversityDetailScreenState();
}

class _UniversityDetailScreenState extends State<UniversityDetailScreen> {
  // --- UPDATED: New data structure for courses ---
  final Map<String, List<Map<String, dynamic>>> placeholderCourseData = const {
    'Faculty of Science & Technology': [
      {
        'name': 'B.Sc. in Computer Science',
        'description':
        'A comprehensive study of computation, software systems, and algorithmic problem-solving.',
        'jobs': ['Software Engineer', 'Data Analyst', 'Systems Architect', 'DevOps Engineer'],
        'requirements': {
          'LGCSE': 'Mathematics: A, Physics: B, English: C',
          'IGCSE': 'Mathematics: A, Physics: B, English: C',
          'IB': 'Math HL: 5, Physics HL: 5',
          'A-Level': 'Mathematics: B, Physics: B',
        }
      },
      {
        'name': 'B.Eng. in Electrical Engineering',
        'description':
        'Focuses on the study and application of electricity, electronics, and electromagnetism.',
        'jobs': ['Electrical Engineer', 'Control Systems Engineer', 'Robotics Engineer'],
        'requirements': {
          'LGCSE': 'Mathematics: A, Physics: A, English: C',
          'IGCSE': 'Mathematics: A, Physics: A, English: C',
        }
      },
    ],
    'Faculty of Humanities': [
      {
        'name': 'B.A. in English Language and Linguistics',
        'description':
        'Explores the structure, history, and social aspects of the English language.',
        'jobs': ['Editor', 'Teacher', 'Public Relations Specialist', 'Copywriter'],
        'requirements': {
          'LGCSE': 'English: A, History: B',
          'A-Level': 'English Literature: B',
        }
      },
    ],
    'Faculty of Commerce': [],
    'Faculty of Engineering': [],
  };

  @override
  Widget build(BuildContext context) {
    final facultyKeys = placeholderCourseData.keys.toList();

    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
        elevation: 0,
        title: Text(
          widget.universityName,
          style: const TextStyle(
            color: AppTheme.kPrimaryWhite,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          maxLines: 2,
        ),
        iconTheme: const IconThemeData(color: AppTheme.kPrimaryWhite),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded, color: AppTheme.kPrimaryWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Faculties',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.kPrimaryWhite,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: facultyKeys.length,
                itemBuilder: (context, index) {
                  final facultyName = facultyKeys[index];
                  final courses = placeholderCourseData[facultyName]!;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    color: AppTheme.getCardColor(ScreenType.explore),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        facultyName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppTheme.kPrimaryWhite,
                          fontSize: 16,
                        ),
                      ),
                      iconColor: AppTheme.kPrimaryWhite,
                      collapsedIconColor: AppTheme.kPrimaryWhite,
                      children: courses.map((course) {
                        return ExpansionTile(
                          tilePadding: const EdgeInsets.only(left: 32.0, right: 16.0),
                          title: Text(
                            course['name'] as String,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          children: [
                            _buildCourseDetails(course),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseDetails(Map<String, dynamic> course) {
    return Container(
      color: AppTheme.getBackgroundColor(ScreenType.explore),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course['description'] as String,
            style: TextStyle(
                fontFamily: 'Nunito Sans',
                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                height: 1.5),
          ),
          const SizedBox(height: 16),
          _buildJobsSection(course['jobs'] as List<String>),
          const SizedBox(height: 16),
          _buildRequirementsSection(
              course['requirements'] as Map<String, String>),
        ],
      ),
    );
  }

  Widget _buildJobsSection(List<String> jobs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Job Opportunities',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppTheme.kPrimaryWhite,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: jobs.map((job) {
            return Chip(
              label: Text(job),
              backgroundColor: AppTheme.getCardColor(ScreenType.explore),
              labelStyle: TextStyle(
                fontFamily: 'Nunito Sans',
                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRequirementsSection(Map<String, String> requirements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Admission Requirements',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppTheme.kPrimaryWhite,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        ...requirements.entries.map((req) {
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.check_circle_outline,
                color: AppTheme.kAccentRed, size: 16),
            title: Text(
              '${req.key}: ${req.value}',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}