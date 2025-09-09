import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'dashboard_screen.dart';
import 'explore_screen.dart';
import 'my_plan_screen.dart';
import 'profile_screen.dart';

class MainAppShell extends StatefulWidget {
  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    ExploreScreen(),
    MyPlanScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppTheme.kContentCardDark,
          border: Border(
            top: BorderSide(
              color: AppTheme.kPrimaryWhite.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              _buildNavItem(
                icon: Icons.dashboard_rounded,
                label: 'Dashboard',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.explore_rounded,
                label: 'Explore',
                index: 1,
              ),
              _buildNavItem(
                icon: Icons.assignment_rounded,
                label: 'My Plan',
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.kContentCardDark,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
              // Pressed-in effect for selected item
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: const Offset(2, 2),
                blurRadius: 6,
                spreadRadius: -3,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                offset: const Offset(-1, -1),
                blurRadius: 4,
                spreadRadius: -2,
              ),
            ]
                : null, // No shadows for inactive tabs - flat appearance
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppTheme.kAccentRed : AppTheme.kPrimaryWhite.withValues(alpha: 0.6),
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppTheme.kAccentRed : AppTheme.kPrimaryWhite.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}