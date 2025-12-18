import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'profile_emilys.dart';

class LoginApiScreen extends StatefulWidget {
  const LoginApiScreen({super.key});

  @override
  State<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends State<LoginApiScreen> {
  final _userController = TextEditingController(text: "emilys");
  final _passController = TextEditingController(text: "emilyspass");

  bool isLoading = false;
  final Dio dio = Dio();

  Future<void> login() async {
    setState(() => isLoading = true);

    try {
      final response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: {
          "username": _userController.text.trim(),
          "password": _passController.text.trim(),
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      if (!mounted) return;

      setState(() => isLoading = false);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileEmilys(
              user: response.data,
            ),
          ),
        );
      } else {
        _showError("Đăng nhập thất bại");
      }
    } on DioException catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      _showError(e.response?.data["message"] ?? "Sai tài khoản hoặc mật khẩu");
    } catch (_) {
      if (!mounted) return;
      setState(() => isLoading = false);
      _showError("Có lỗi xảy ra");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(28),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Demo account box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F0FE),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent.shade100),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tài khoản demo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text("👤 Username: emilys"),
                      Text("🔒 Password: emilyspass"),
                    ],
                  ),
                ),

                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Đăng Nhập",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Username field
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xFFF5F7FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password field
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: const Color(0xFFF5F7FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Login button
                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                const SizedBox(height: 16),

                // Optional: Forgot password or other links
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
