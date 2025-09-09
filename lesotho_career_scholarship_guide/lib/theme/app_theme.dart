import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screen type enum for context-aware color selection
enum ScreenType {
  dashboard,
  explore,
  myPlan,
  profile,
}

class AppTheme {
  AppTheme._();

  // --- BASE DARK THEME COLORS ---
  static const Color kBackgroundDarkest = Color(0xFF0F1320);
  static const Color kContentCardDark = Color(0xFF1F2330);
  static const Color kAccentRed = Color(0xFFE94546);
  static const Color kPrimaryWhite = Color(0xFFF0F6FC);

  // --- CONTEXT-AWARE COLOR METHODS ---
  /// Returns the appropriate background color based on screen type
  /// Dashboard gets the original dark background, all others get the card color
  static Color getBackgroundColor(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.dashboard:
        return kBackgroundDarkest; // Original: #0F1320
      case ScreenType.explore:
      case ScreenType.myPlan:
      case ScreenType.profile:
        return kContentCardDark;   // Swapped: #1F2330
    }
  }

  /// Returns the appropriate card/content color based on screen type
  /// Dashboard gets the original card color, all others get the background color
  static Color getCardColor(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.dashboard:
        return kContentCardDark;   // Original: #1F2330
      case ScreenType.explore:
      case ScreenType.myPlan:
      case ScreenType.profile:
        return kBackgroundDarkest; // Swapped: #0F1320
    }
  }

  // --- THEME DATA (unchanged - uses original colors for general theming) ---
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: kBackgroundDarkest,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: kContentCardDark, // Used for cards, etc.
      secondary: kAccentRed,
      background: kBackgroundDarkest,
      surface: kContentCardDark,
      onPrimary: kPrimaryWhite,
      onSecondary: kPrimaryWhite,
      onBackground: kPrimaryWhite,
      onSurface: kPrimaryWhite,
    ),

    // --- Bottom Navigation Bar Theme ---
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentCardDark,      // Background: #1F2330
      selectedItemColor: kAccentRed,          // Highlight/Selection: #E94546
      unselectedItemColor: kPrimaryWhite,     // Icon Color: #F0F6FC
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),

    // Other component themes for consistency
    cardTheme: CardTheme(
      color: kContentCardDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kBackgroundDarkest,
      elevation: 0,
    ),
  );

// Note: Your old lightTheme is still here if you want to switch back later.
// ... (previous lightTheme code)
}