import 'package:flutter/material.dart';
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
  // This controller manages which screen is currently selected.
  int _selectedIndex = 0;

  // This is the list of screens to switch between.
  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    ExploreScreen(),
    MyPlanScreen(),
    ProfileScreen(),
  ];

  // This method is called when a navigation item is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body will display the screen from the list based on the selected index.
      body: _screens.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        // Styling based on your feature list:
        type: BottomNavigationBarType.fixed, // Important for background color
        backgroundColor: const Color(0xFF0E117A),
        selectedItemColor: const Color(0xFF12E2A4),
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle: const TextStyle(fontFamily: 'Nunito Sans', fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Nunito Sans'),

        // The list of navigation items.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'My Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}