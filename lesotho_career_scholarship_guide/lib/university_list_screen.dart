import 'package:flutter/material.dart';
import 'package:circle_flags/circle_flags.dart';
import 'university_detail_screen.dart';
import 'theme/app_theme.dart';

class UniversityListScreen extends StatelessWidget {
  const UniversityListScreen({Key? key}) : super(key: key);

  // --- FIX: Restored the full list of university regions ---
  final Map<String, List<String>> placeholderUniversityRegions = const {
    'Lesotho Universities': [
      'National University of Lesotho',
      'Limkokwing University of Creative Technology',
    ],
    'South African Universities': [
      'University of Cape Town',
      'University of the Witwatersrand',
      'Stellenbosch University',
    ],
    'SADC Universities': [
      'University of Botswana',
      'University of Namibia',
    ],
    'American Universities': [
      'Harvard University',
      'Massachusetts Institute of Technology (MIT)',
    ],
    'Canadian Universities': [
      'University of Toronto',
      'McGill University',
    ],
    'European Universities': [
      'University of Oxford',
      'ETH Zurich',
    ],
    'Australian Universities': [
      'The University of Melbourne',
    ],
    'Indian Universities': [
      'Indian Institute of Technology Bombay (IITB)',
    ],
    'China Universities': [
      'Peking University',
    ],
  };

  String? _getRegionIcon(String region) {
    String regionLower = region.toLowerCase();
    if (regionLower.contains('lesotho')) return 'ls';
    if (regionLower.contains('south african')) return 'za';
    if (regionLower.contains('american')) return 'us';
    if (regionLower.contains('canadian')) return 'ca';
    if (regionLower.contains('australian')) return 'au';
    if (regionLower.contains('indian')) return 'in';
    if (regionLower.contains('china')) return 'cn';
    if (regionLower.contains('sadc')) return 'assets/icons/africa_map_icon.png';
    if (regionLower.contains('european')) return 'assets/icons/europe_map_icon.png';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundColor(ScreenType.explore),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: AppTheme.kPrimaryWhite),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: AppTheme.kPrimaryWhite),
                hintText: 'Search for a university...',
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: placeholderUniversityRegions.keys.length,
                itemBuilder: (context, index) {
                  final region = placeholderUniversityRegions.keys.elementAt(index);
                  final universities = placeholderUniversityRegions[region]!;
                  final iconData = _getRegionIcon(region);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: AppTheme.getCardColor(ScreenType.explore),
                    child: ExpansionTile(
                      leading: iconData != null
                          ? SizedBox(
                        width: 28,
                        height: 28,
                        child: iconData.contains('/')
                            ? Image.asset(iconData, color: AppTheme.kAccentRed)
                            : CircleFlag(iconData, size: 28),
                      )
                          : const Icon(Icons.public_rounded, color: AppTheme.kAccentRed, size: 28),
                      title: Text(
                        region,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppTheme.kPrimaryWhite,
                          fontSize: 16,
                        ),
                      ),
                      iconColor: AppTheme.kPrimaryWhite,
                      collapsedIconColor: AppTheme.kPrimaryWhite,
                      children: universities.map((university) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                          decoration: BoxDecoration(
                            color: AppTheme.getBackgroundColor(ScreenType.explore),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(
                              university,
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                color: AppTheme.kPrimaryWhite.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                            leading: Icon(Icons.school_rounded, color: AppTheme.kPrimaryWhite.withOpacity(0.7), size: 20),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UniversityDetailScreen(
                                    universityName: university,
                                  ),
                                ),
                              );
                            },
                          ),
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