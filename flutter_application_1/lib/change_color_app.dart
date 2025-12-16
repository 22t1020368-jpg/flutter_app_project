import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color backgroundColor = Colors.grey.shade200;
  String colorName = "Xám nhạt";

  final List<Map<String, dynamic>> colors = [
    {"color": Colors.blue.shade200, "name": "Xanh dương nhạt"},
    {"color": Colors.green.shade200, "name": "Xanh lá nhạt"},
    {"color": Colors.pink.shade200, "name": "Hồng nhạt"},
    {"color": Colors.orange.shade200, "name": "Cam nhạt"},
    {"color": Colors.purple.shade200, "name": "Tím nhạt"},
  ];

  void changeColor() {
    final random = Random();
    final selected = colors[random.nextInt(colors.length)];

    setState(() {
      backgroundColor = selected["color"];
      colorName = selected["name"];
    });
  }

  void resetColor() {
    setState(() {
      backgroundColor = Colors.grey.shade200;
      colorName = "Xám nhạt";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng đổi màu nền"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Màu hiện tại: $colorName",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: changeColor,
                child: const Text("Đổi màu"),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: resetColor,
                child: const Text("Đặt lại"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
