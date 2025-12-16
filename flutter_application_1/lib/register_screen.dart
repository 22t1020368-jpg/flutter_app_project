import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  String nameError = "";
  String emailError = "";
  String passwordError = "";
  String confirmError = "";
  String successMessage = "";

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void register() {
    setState(() {
      nameError = "";
      emailError = "";
      passwordError = "";
      confirmError = "";
      successMessage = "";
    });

    bool hasError = false;

    if (nameController.text.trim().isEmpty) {
      nameError = "Vui lòng nhập họ tên";
      hasError = true;
    }

    if (emailController.text.trim().isEmpty) {
      emailError = "Vui lòng nhập email";
      hasError = true;
    } else if (!isValidEmail(emailController.text.trim())) {
      emailError = "Email không hợp lệ";
      hasError = true;
    }

    if (passwordController.text.isEmpty) {
      passwordError = "Vui lòng nhập mật khẩu";
      hasError = true;
    }

    if (confirmController.text.isEmpty) {
      confirmError = "Vui lòng xác nhận mật khẩu";
      hasError = true;
    } else if (confirmController.text != passwordController.text) {
      confirmError = "Mật khẩu xác nhận không trùng";
      hasError = true;
    }

    if (hasError) {
      setState(() {});
      return;
    }

    setState(() {
      successMessage = "Đăng ký thành công!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          
              const Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

             
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Họ tên",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              if (nameError.isNotEmpty)
                _errorText(nameError),

              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              if (emailError.isNotEmpty)
                _errorText(emailError),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              if (passwordError.isNotEmpty)
                _errorText(passwordError),

              const SizedBox(height: 20),

             
              TextField(
                controller: confirmController,
                obscureText: !showConfirmPassword,
                decoration: InputDecoration(
                  labelText: "Xác nhận mật khẩu",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showConfirmPassword = !showConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              if (confirmError.isNotEmpty)
                _errorText(confirmError),

              const SizedBox(height: 25),

             
              if (successMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    successMessage,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

             
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _errorText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
