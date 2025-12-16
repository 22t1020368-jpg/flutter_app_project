import 'package:flutter/material.dart';

class ProfileEmilys extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfileEmilys({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F7),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.indigo.shade700,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar Left
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo.shade700, Colors.indigo.shade500],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(user["image"] ?? ""),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "${user['firstName'] ?? ''} ${user['lastName'] ?? ''}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${user['username'] ?? ''}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _infoSidebar(
                          icon: Icons.location_on,
                          label: user["location"] ?? "USA",
                        ),
                        _infoSidebar(
                          icon: Icons.phone,
                          label: user["phone"] ?? "098 999 0009",
                        ),
                        _infoSidebar(
                          icon: Icons.email,
                          label: user["email"] ?? "your-email@domain.com",
                        ),
                        _infoSidebar(
                          icon: Icons.web,
                          label: user["website"] ?? "https://www.facebook.com/",
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Main Right
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("WORK EXPERIENCE", Icons.work),
                      _experienceCard(
                        start: "2013-05",
                        end: "2013-09",
                        title: "Part-time English Teaching Assistant",
                        company: "ABC Center",
                        description:
                            "- Build detailed lectures schedule based on varied levels of learners from beginners to intermediate.\n- Assist main coach to check writings, do scoring and assessment.\n- Keep track of student’s English progress to give exact comment.\n- Always inspire students to learning English by stressing importance of learning foreign language.\n- Recognition: Excellent Learning Assistant Award.",
                      ),
                      const SizedBox(height: 16),
                      _sectionTitle("EDUCATION", Icons.school),
                      _educationCard(
                        start: "2013-10",
                        end: "2015-09",
                        degree: "Bachelor of English Language",
                        school: "University NYC",
                        result: "8.5",
                      ),
                      const SizedBox(height: 16),
                      _sectionTitle("COMMUNITY ACTIVITY", Icons.group),
                      _activityCard(
                        title: "Volunteer English Teacher",
                        organization: "Local NGO",
                        description:
                            "- Conduct weekly English classes for underprivileged children.\n- Organize educational games and activities.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoSidebar({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade700),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _experienceCard({
    required String start,
    required String end,
    required String title,
    required String company,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$start - $end",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
            ),
            Text(
              company,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 14, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _educationCard({
    required String start,
    required String end,
    required String degree,
    required String school,
    required String result,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$start - $end",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Text(
              degree,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
            ),
            Text(
              school,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              "Total result: $result",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityCard({
    required String title,
    required String organization,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
            ),
            Text(
              organization,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 14, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
