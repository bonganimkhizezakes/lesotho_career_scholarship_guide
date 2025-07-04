import 'package:flutter/material.dart';

class CareerDetailScreen extends StatefulWidget {
  final String careerName;

  const CareerDetailScreen({
    Key? key,
    required this.careerName,
  }) : super(key: key);

  @override
  State<CareerDetailScreen> createState() => _CareerDetailScreenState();
}

class _CareerDetailScreenState extends State<CareerDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E117A), // Deep indigo background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E117A), // Same indigo color to blend in
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF8F9FA), // Off-white back button
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.careerName,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F9FA), // Off-white title
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_border_rounded,
              color: Color(0xFFF8F9FA), // Off-white save button
            ),
            onPressed: () {
              // Save functionality placeholder - no logic yet
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: const Color(0xFFF8F9FA),
          labelColor: const Color(0xFFF8F9FA),
          unselectedLabelColor: const Color(0xFFB8BCC8),
          labelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: 'About'),
            Tab(text: 'Video'),
            Tab(text: 'Prospects'),
            Tab(text: 'Requirements'),
            Tab(text: 'Salary'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAboutTab(),
          _buildVideoTab(),
          _buildProspectsTab(),
          _buildRequirementsTab(),
          _buildSalaryTab(),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About This Career',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 16,
              color: Color(0xFFB8BCC8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Key Responsibilities',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('Design and develop innovative software solutions'),
          _buildBulletPoint('Collaborate with cross-functional teams to deliver projects'),
          _buildBulletPoint('Maintain and optimize existing systems and applications'),
          _buildBulletPoint('Stay updated with latest technology trends and best practices'),
        ],
      ),
    );
  }

  Widget _buildVideoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explanatory Video',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1E8A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_outline,
                    size: 64,
                    color: Color(0xFFF8F9FA),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Career Overview Video',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFFF8F9FA),
                    ),
                  ),
                  Text(
                    'Duration: 5:30',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                      color: Color(0xFFB8BCC8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'This video provides an in-depth look at what it\'s like to work in this field, featuring interviews with professionals and real workplace scenarios.',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 16,
              color: Color(0xFFB8BCC8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProspectsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Career Prospects',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Growth Opportunities',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('High demand in the job market with 15% growth expected'),
          _buildBulletPoint('Opportunities for career advancement and specialization'),
          _buildBulletPoint('Remote work possibilities and flexible schedules'),
          _buildBulletPoint('Continuous learning and skill development opportunities'),
          const SizedBox(height: 24),
          const Text(
            'Career Progression Path',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildProgressionCard('Entry Level', 'Junior positions, 0-2 years experience'),
          _buildProgressionCard('Mid Level', 'Senior positions, 3-5 years experience'),
          _buildProgressionCard('Senior Level', 'Leadership roles, 5+ years experience'),
        ],
      ),
    );
  }

  Widget _buildRequirementsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Entry Requirements',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Universities',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('Mathematics (Grade A or equivalent)'),
          _buildBulletPoint('Physical Sciences (Grade B or equivalent)'),
          _buildBulletPoint('English (Grade B or equivalent)'),
          _buildBulletPoint('Minimum APS of 32 points'),
          const SizedBox(height: 24),
          const Text(
            'Universities of Technology',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('Mathematics (Grade C or equivalent)'),
          _buildBulletPoint('Physical Sciences (Grade C or equivalent)'),
          _buildBulletPoint('English (Grade C or equivalent)'),
          _buildBulletPoint('Minimum APS of 26 points'),
          const SizedBox(height: 24),
          const Text(
            'Additional Requirements',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('National Benchmark Test (NBT) may be required'),
          _buildBulletPoint('Portfolio submission for creative fields'),
          _buildBulletPoint('Interview process for some institutions'),
        ],
      ),
    );
  }

  Widget _buildSalaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Entry Level Salary',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFFF8F9FA),
            ),
          ),
          const SizedBox(height: 16),
          _buildSalaryCard('Gauteng', 'R25,000 - R35,000', 'per month'),
          _buildSalaryCard('Western Cape', 'R22,000 - R32,000', 'per month'),
          _buildSalaryCard('KwaZulu-Natal', 'R20,000 - R28,000', 'per month'),
          _buildSalaryCard('Eastern Cape', 'R18,000 - R25,000', 'per month'),
          _buildSalaryCard('Free State', 'R18,000 - R25,000', 'per month'),
          _buildSalaryCard('Mpumalanga', 'R17,000 - R24,000', 'per month'),
          _buildSalaryCard('Limpopo', 'R17,000 - R24,000', 'per month'),
          _buildSalaryCard('North West', 'R16,000 - R23,000', 'per month'),
          _buildSalaryCard('Northern Cape', 'R16,000 - R22,000', 'per month'),
          const SizedBox(height: 16),
          const Text(
            'Note: Salaries vary based on company size, industry, and individual qualifications. These figures represent typical entry-level ranges.',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 14,
              color: Color(0xFFB8BCC8),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0), // Adjust alignment of bullet
            child: Icon(
              Icons.circle,
              color: Color(0xFFB8BCC8),
              size: 6,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 16,
                color: Color(0xFFB8BCC8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressionCard(String level, String description) {
    return Card(
      color: const Color(0xFF1A1E8A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFF8F9FA),
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                      color: Color(0xFFB8BCC8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryCard(String region, String range, String period) {
    return Card(
      color: const Color(0xFF1A1E8A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  region,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFFF8F9FA),
                  ),
                ),
                Text(
                  period,
                  style: const TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 12,
                    color: Color(0xFFB8BCC8),
                  ),
                ),
              ],
            ),
            Text(
              range,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFF8F9FA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}