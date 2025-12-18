import 'package:flutter/material.dart';
import 'package:flutter_application_1/web_dashboard_screen.dart';
//import 'booking_mock_screen.dart';
//import 'classroom_screen.dart';
//import 'myplace.dart';
//import 'myhomepage.dart';
//import 'login_screen.dart';
//import 'register_screen.dart';
//import 'counter_app.dart';
//import 'countdown_app.dart';
//import 'change_color_app.dart';
//import 'bmi_screen.dart';
//import 'feedback_screen.dart';
//import 'myproduct.dart';
//import 'news_list_screen.dart';
// import 'login_api_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Chỉ chạy bài bạn muốn
      //home: BookingMockScreen(),
      //home: const ClassroomScreen(),
      //home: const MyPlace(),
      //home: const MyHomePage(),
      //home: const LoginScreen(),
      //home: const RegisterScreen(),
      //home: const CounterScreen(),
      //home: const CountdownTimerScreen(),
      //home: const ChangeColorApp(),
      //home: BMIScreen(),
      //home: FeedbackScreen(),
      //home: MyProduct(),
      //home: NewsListScreen(),
      // home: LoginApiScreen(),
      home : WebApp()
    );
  }
}
