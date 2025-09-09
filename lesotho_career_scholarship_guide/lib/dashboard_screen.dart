import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.dashboard),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- FIXED HEADER SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome back, Alex!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryWhite,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildJourneySection(),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // --- SCROLLABLE CONTENT SECTION ---
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.getCardColor(ScreenType.dashboard),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.kPrimaryWhite.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      const Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppTheme.kPrimaryWhite,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _ActionCard(
                              icon: Icons.psychology_alt_rounded,
                              text: 'Take the Career Test',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ActionCard(
                              icon: Icons.school_rounded,
                              text: 'Explore Universities',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Recently Saved',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppTheme.kPrimaryWhite,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            _SavedItemCard(
                              title: 'Software Engineer',
                              subtitle: 'Career Path',
                              icon: Icons.work_outline_rounded,
                            ),
                            _SavedItemCard(
                              title: 'University of Lesotho',
                              subtitle: 'Institution',
                              icon: Icons.school_outlined,
                            ),
                            _SavedItemCard(
                              title: 'Chevening Scholarship',
                              subtitle: 'Scholarship',
                              icon: Icons.card_giftcard_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJourneySection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Journey',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppTheme.kPrimaryWhite,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '25% Complete',
          style: TextStyle(fontFamily: 'Nunito Sans', fontSize: 14, color: AppTheme.kPrimaryWhite),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.25,
          backgroundColor: AppTheme.kPrimaryWhite,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.kAccentRed),
          minHeight: 8,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Next Step: Complete Your Profile',
              style: TextStyle(fontFamily: 'Nunito Sans', fontSize: 14, color: AppTheme.kPrimaryWhite),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, color: AppTheme.kAccentRed, size: 16),
          ],
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ActionCard({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getBackgroundColor(ScreenType.dashboard),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Outer shadows (scaled down for smaller cards)
          // Top-left highlight (light source from top-left)
          BoxShadow(
            color: AppTheme.kPrimaryWhite.withOpacity(0.10),
            offset: const Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
          // Bottom-right shadow (darker shadow)
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: const Offset(2, 2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
          // Inner shadows (inset effect, scaled down)
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(1, 1),
            blurRadius: 3,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: AppTheme.kPrimaryWhite.withOpacity(0.05),
            offset: const Offset(-1, -1),
            blurRadius: 3,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppTheme.kAccentRed, size: 32),
                const SizedBox(height: 12),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                    color: AppTheme.kPrimaryWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SavedItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SavedItemCard({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 120, // Reduced height from 180 to 120
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 30), // Added vertical margin to center the card
      decoration: BoxDecoration(
        color: AppTheme.getBackgroundColor(ScreenType.dashboard),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Outer shadows
          // Top-left highlight (light source from top-left)
          BoxShadow(
            color: AppTheme.kPrimaryWhite.withOpacity(0.12),
            offset: const Offset(-3, -3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          // Bottom-right shadow (darker shadow)
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          // Inner shadows (inset effect)
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 4,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: AppTheme.kPrimaryWhite.withOpacity(0.06),
            offset: const Offset(-1, -1),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppTheme.kAccentRed, size: 24),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 12,
                color: AppTheme.kPrimaryWhite.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: AppTheme.kPrimaryWhite,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}