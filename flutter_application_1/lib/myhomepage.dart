import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OeschinenLakePage();
  }
}

class OeschinenLakePage extends StatelessWidget {
  const OeschinenLakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text("My Homepage"),
  backgroundColor: const Color.fromARGB(0, 13, 162, 192),
  elevation: 0,
  automaticallyImplyLeading: false, // <-- thêm dòng này
),

      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          // Ảnh trên cùng
          Image.asset(
            "assets/images/myhomepage.jpg",
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Tiêu đề + địa điểm + sao
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Tiêu đề + địa điểm
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Oeschinen Lake Campground",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Kandersteg, Switzerland",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Icon ngôi sao + số
                const Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                const Text("41"),
              ],
            ),
          ),

          // Hàng nút Call - Route - Share
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _ActionButton(icon: Icons.call, label: "CALL"),
                _ActionButton(icon: Icons.near_me, label: "ROUTE"),
                _ActionButton(icon: Icons.share, label: "SHARE"),
              ],
            ),
          ),

          // Nội dung mô tả
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              "Lake Oeschinen lies at the foot of the Blüemlisalp in "
              "the Bernese Alps. Situated 1,578 meters above sea "
              "level, it is one of the larger Alpine Lakes. A gondola "
              "ride from Kandersteg, followed by a half-hour walk "
              "through pastures and pine forest, leads you to the lake, "
              "which warms to 20 degrees Celsius in the summer. "
              "Activities enjoyed here include rowing, and riding the "
              "summer toboggan run.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget nút chức năng (Call, Route, Share)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}