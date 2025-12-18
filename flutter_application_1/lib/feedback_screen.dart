import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _nameController = TextEditingController();
  final _contentController = TextEditingController();

  int? selectedRating;
  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Phản Hồi"),
        backgroundColor: Colors.red,
        centerTitle: true,
        automaticallyImplyLeading: false, 
      ),

      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
          
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              color: Colors.red,
              child: const Text(
                "Gửi phản hồi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // FORM
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Họ tên
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Họ tên",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Đánh giá (dropdown)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black38),
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Đánh giá (1–5 sao)",
                        ),
                        value: selectedRating,
                        items: List.generate(
                          5,
                          (i) => DropdownMenuItem(
                            value: i + 1,
                            child: Text("${i + 1} ⭐"),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedRating = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 16),
                    TextField(
                      controller: _contentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Nội dung góp ý",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.message_outlined),
                      ),
                    ),

                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_nameController.text.isEmpty ||
                              _contentController.text.isEmpty ||
                              selectedRating == null) {
                            setState(() {
                              resultMessage = "Vui lòng nhập đầy đủ thông tin!";
                            });
                            return;
                          }

                          setState(() {
                            resultMessage =
                                "Cảm ơn bạn đã phản hồi! ⭐ $selectedRating";
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Gửi phản hồi",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Thông báo kết quả
                    Text(
                      resultMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
