import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  Color getCounterColor() {
    if (_counter > 0) return Colors.green;
    if (_counter < 0) return Colors.red;
    return Colors.black;
  }

  void increase() {
    setState(() {
      _counter++;
    });
  }

  void decrease() {
    setState(() {
      _counter--;
    });
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Ứng dụng Đếm Số',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Giá trị hiện tại:",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: getCounterColor(),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: decrease,
                  icon: const Icon(Icons.remove),
                  label: const Text("Giảm"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: increase,
                  icon: const Icon(Icons.add),
                  label: const Text("Tăng"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}