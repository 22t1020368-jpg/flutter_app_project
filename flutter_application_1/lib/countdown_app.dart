import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerScreen extends StatefulWidget {
  const CountdownTimerScreen({super.key});

  @override
  State<CountdownTimerScreen> createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel(); // Hủy timer để tránh rò rỉ bộ nhớ
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    if (_controller.text.isEmpty) return;

    int seconds = int.tryParse(_controller.text) ?? 0;
    if (seconds <= 0) return;

    setState(() {
      _remainingSeconds = seconds;
      _isRunning = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("⏰ Hết thời gian!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 0;
      _isRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          '🕒 Bộ đếm thời gian',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nhập số giây cần đếm:",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              formatTime(_remainingSeconds),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Bắt đầu"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Đặt lại"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}