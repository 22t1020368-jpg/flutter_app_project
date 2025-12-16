import 'package:flutter/material.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      {
        'title': 'XML và ứng dụng - Nhóm 1',
        'code': '2025-2026.1.TIN4583.001',
        'students': 58,
        'image': 'assets/images/classroom1.jpg',
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.006',
        'students': 55,
        'image': 'assets/images/classroom2.jpg',
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.005',
        'students': 52,
        'image': 'assets/images/classroom3.jpg',
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.004',
        'students': 50,
        'image': 'assets/images/classroom4.jpg',
      },
      {
        'title': 'Lập trình ứng dụng cho các t...',
        'code': '2025-2026.1.TIN4403.003',
        'students': 52,
        'image': 'assets/images/classroom5.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final item = classes[index];
            return ClassroomCard(
              title: item['title'] as String,
              code: item['code'] as String,
              students: item['students'] as int,
              image: item['image'] as String,
            );
          },
        ),
      ),
    );
  }
}

class ClassroomCard extends StatelessWidget {
  final String title;
  final String code;
  final int students;
  final String image;

  const ClassroomCard({
    super.key,
    required this.title,
    required this.code,
    required this.students,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.45), // lớp phủ tối
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(code, style: const TextStyle(color: Colors.white70)),
            const Spacer(),
            Text(
              '$students học viên',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
