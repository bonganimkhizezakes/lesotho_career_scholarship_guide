import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E117A), // Deep indigo background
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 40), // Top spacing for status bar

          // Welcome Header
          const Text(
            'Welcome back, Alex!',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF8F9FA), // Off-white
            ),
          ),

          const SizedBox(height: 24),

          // "The Journey" Visual Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: const Color(0xFF1A1F8A), // Slightly lighter indigo
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Journey',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF8F9FA),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Progress Indicator
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '25% Complete',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 14,
                          color: Color(0xFFF8F9FA),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.25,
                        backgroundColor: const Color(0xFF6B7280), // Muted gray
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF12E2A4), // Vibrant mint
                        ),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Next Step
                  Row(
                    children: [
                      const Text(
                        'Next Step: Complete Your Profile',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 16,
                          color: Color(0xFFF8F9FA),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF12E2A4),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Get Started Section Title
          const Text(
            'Get Started',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF8F9FA),
            ),
          ),

          const SizedBox(height: 16),

          // Quick Action Cards
          Row(
            children: [
              // Card 1: Career Test
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color(0xFF1A1F8A),
                  child: InkWell(
                    onTap: () {
                      // Placeholder for navigation
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.psychology_alt_rounded,
                            color: Color(0xFF12E2A4),
                            size: 32,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Take the Career Test',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF8F9FA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Card 2: Explore Universities
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color(0xFF1A1F8A),
                  child: InkWell(
                    onTap: () {
                      // Placeholder for navigation
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.school_rounded,
                            color: Color(0xFF12E2A4),
                            size: 32,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Explore Universities',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF8F9FA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Recently Saved Section Title
          const Text(
            'Recently Saved',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFFF8F9FA),
            ),
          ),

          const SizedBox(height: 16),

          // Recently Saved Items (Horizontal Scroll)
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                // Placeholder data for saved items
                final savedItems = [
                  {'title': 'Software Engineer', 'subtitle': 'Career Path'},
                  {'title': 'University of Lesotho', 'subtitle': 'Institution'},
                  {'title': 'Data Science', 'subtitle': 'Career Path'},
                  {'title': 'NUL Business School', 'subtitle': 'Institution'},
                ];

                final item = savedItems[index];

                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color(0xFF1A1F8A),
                    child: InkWell(
                      onTap: () {
                        // Placeholder for navigation
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              item['subtitle'] == 'Career Path'
                                  ? Icons.work_outline_rounded
                                  : Icons.school_outlined,
                              color: const Color(0xFF12E2A4),
                              size: 24,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item['subtitle']!,
                              style: const TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: Color(0xFF9CA3AF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFF8F9FA),
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24), // Bottom spacing
        ],
      ),
    );
  }
}