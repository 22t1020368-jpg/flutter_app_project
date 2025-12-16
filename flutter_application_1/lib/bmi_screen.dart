
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();

  String result = "";

  void calcBMI() {
    final h = double.tryParse(heightCtrl.text);
    final w = double.tryParse(weightCtrl.text);

    if (h == null || w == null) {
      setState(() {
        result = "Vui lòng nhập đầy đủ chiều cao và cân nặng!";
      });
      return;
    }

    final bmi = w / (h * h);
    String type;

    if (bmi < 18.5) {
      type = "Thiếu cân";
    } else if (bmi < 25) {
      type = "Bình thường";
    } else if (bmi < 30) {
      type = "Thừa cân";
    } else {
      type = "Béo phì";
    }

    setState(() {
      result = "Chỉ số BMI: ${bmi.toStringAsFixed(2)}\nPhân loại: $type";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính BMI"),
        backgroundColor: Color(0xff0a6847),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pushNamed(context, "/main_home");
        //   },
        // ),
      ),
      backgroundColor: const Color(0xfff5f5f5),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Tính chỉ số BMI",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff0a6847),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: heightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Chiều cao (m)",
                  hintText: "Ví dụ: 1.75",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: weightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Cân nặng (kg)",
                  hintText: "Ví dụ: 70",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0a6847),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: calcBMI,
                  child: const Text(
                    "Tính BMI",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),

              const SizedBox(height: 20),

              
            ],
          ),
        ),
      ),
    );
  }
}