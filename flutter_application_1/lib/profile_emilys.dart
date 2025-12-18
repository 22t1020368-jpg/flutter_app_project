import 'package:flutter/material.dart';

class ProfileEmilys extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfileEmilys({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 234, 235, 239),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _leftColumn(),
                      const SizedBox(height: 24),
                      _rightColumn(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _leftColumn()),
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: _rightColumn()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // ================== CỘT TRÁI ==================
  Widget _leftColumn() {
    return Column(
      children: [
        _cardContainer(child: _avatarCard()),
        const SizedBox(height: 16),
        _cardContainer(child: _nameCard()),
        const SizedBox(height: 16),
        _cardContainer(child: _contactCard()),
      ],
    );
  }

  Widget _cardContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _avatarCard() {
    return Column(
      children: [
        Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.indigo.shade100,
            image: user['image'] != null
                ? DecorationImage(
                    image: NetworkImage(user['image']),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _nameCard() {
    return Column(
      children: [
        Text(
          "${user['firstName'] ?? ''} ${user['lastName'] ?? ''}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          user['username'] ?? '',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _contactCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactItem(Icons.location_on, user["location"] ?? "USA"),
        _contactItem(Icons.phone, user["phone"] ?? "098 999 0009"),
        _contactItem(Icons.email, user["email"] ?? "your-email@domain.com"),
        _contactItem(Icons.web, user["website"] ?? "https://www.facebook.com/"),
      ],
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
          const SizedBox(width: 6),
          Flexible(
            child: Text(text, style: TextStyle(color: Colors.grey.shade800)),
          ),
        ],
      ),
    );
  }

  // ================== CỘT PHẢI ==================
  Widget _rightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Work Experience"),
        _simpleCard("2013-05 - 2013-09", "English Teaching Assistant", "ABC Center"),
        _simpleCard("2014-01 - 2015-09", "English Tutor", "XYZ Academy"),
        const SizedBox(height: 16),
        _sectionTitle("Education"),
        _simpleCard("2013-10 - 2015-09", "Bachelor of English Language", "University NYC"),
        const SizedBox(height: 16),
        _sectionTitle("Community Activity"),
        _simpleCard("", "Volunteer English Teacher", "Local NGO"),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _simpleCard(String period, String title, String subtitle) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (period.isNotEmpty)
              Text(period, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}
