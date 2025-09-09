import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper widget for creating consistent setting list tiles
  Widget _buildSettingsTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.kPrimaryWhite.withOpacity(0.8)),
      title: Text(
        title, // Corrected: Uses the title variable
        style: const TextStyle(
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: AppTheme.kPrimaryWhite,
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.kPrimaryWhite.withOpacity(0.8), size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.profile),
      appBar: AppBar(
        backgroundColor: AppTheme.getBackgroundColor(ScreenType.profile),
        elevation: 0,
        title: const Text(
          'Profile & Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppTheme.kPrimaryWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // User Info Header
            CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.getCardColor(ScreenType.profile),
              child: const Icon(
                Icons.person,
                size: 40,
                color: AppTheme.kPrimaryWhite,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tshepo Moloi',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppTheme.kPrimaryWhite,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'tshepo.m@email.com',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 16,
                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 24),

            // Gamification Card
            Card(
              color: AppTheme.getCardColor(ScreenType.profile),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Progress',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppTheme.kPrimaryWhite,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level 5',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          '1,250 Points',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.bold,
                            color: AppTheme.kAccentRed, // Accent color
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.6, // 60% progress to next level
                      backgroundColor: AppTheme.kPrimaryWhite.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.kAccentRed),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Settings List
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsTile(icon: Icons.person_outline, title: 'Edit Profile', onTap: () {}),
                  _buildSettingsTile(icon: Icons.credit_card_outlined, title: 'Manage Subscription', onTap: () {}),
                  _buildSettingsTile(icon: Icons.notifications_outlined, title: 'Notifications', onTap: () {}),
                  _buildSettingsTile(icon: Icons.shield_outlined, title: 'Privacy Policy', onTap: () {}),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.kAccentRed, // Use theme accent for consistency
                    foregroundColor: AppTheme.kPrimaryWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}