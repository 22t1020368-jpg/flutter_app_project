import 'package:flutter/material.dart';
import 'booking_mock_screen.dart';
import 'classroom_screen.dart';
import 'myplace.dart';
import 'myhomepage.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'counter_app.dart';
import 'countdown_app.dart';
import 'change_color_app.dart';
import 'bmi_screen.dart';
import 'feedback_screen.dart';
import 'myproduct.dart';
import 'news_list_screen.dart';
import 'login_api_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedIndex;

  final List<String> baiTitles = [
    'Booking Mock',
    'Classroom',
    'My Place',
    'My Home Page',
    'Login Screen',
    'Register Screen',
    'Counter App',
    'Countdown App',
    'Change Color App',
    'BMI Screen',
    'Feedback Screen',
    'My Product',
    'News List',
    'Login API',
  ];

  final List<Widget> baiList = [
    BookingMockScreen(),
    ClassroomScreen(),
    MyPlace(),
    MyHomePage(),
    LoginScreen(),
    RegisterScreen(),
    CounterScreen(),
    CountdownTimerScreen(),
    ChangeColorApp(),
    BMIScreen(),
    FeedbackScreen(),
    MyProduct(),
    NewsListScreen(),
    LoginApiScreen(),
  ];

  final double headerHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
       
          Container(
            width: 270,
            color: Colors.grey[100],
            child: Column(
              children: [
                Container(
                  height: headerHeight,
                  width: double.infinity,
                  color: Colors.indigo[500],
                  child: Center(
                    child: Text(
                      'Danh sách bài tập',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: baiTitles.length,
                    itemBuilder: (context, index) => Card(
                      color: selectedIndex == index
                          ? Colors.indigo[100]
                          : Colors.white,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          baiTitles[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        onTap: () => setState(() => selectedIndex = index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 270,
            color: Colors.blue[50],
            child: Column(
              children: [
                Container(
                  height: headerHeight,
                  width: double.infinity,
                  color: Colors.indigo[500],
                  child: Center(
                    child: Text(
                      'Profile Sinh Viên',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Center(
  child: CircleAvatar(
    radius: 40,
    backgroundColor: Colors.indigo,
    backgroundImage: AssetImage('assets/images/anhprofile.jpg'), // đường dẫn tới ảnh của bạn
  ),
),

                          SizedBox(height: 16),
                          Text('Họ và tên: Nguyễn Đăng Quốc',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('MSSV: 22T1020368',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 8),
                          Text('Lớp: CNTT K46E', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 16),
                          Divider(thickness: 1),
                          // SizedBox(height: 16),
                          // Text('Thông tin khác:', style: TextStyle(fontSize: 16)),
                          // SizedBox(height: 8),
                          // Text('Email:22t1020368@gmail.com'),
                          // Text('Điện thoại: 0123456789'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: selectedIndex == null
                ? Container(
                    color: Colors.grey[50],
                    child: Center(
                      child: Text(
                        'Chọn một bài để xem nội dung',
                        style:
                            TextStyle(fontSize: 20, color: Colors.grey[500]),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Positioned.fill(
                        child: baiList[selectedIndex!],
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[400],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () =>
                                setState(() => selectedIndex = null),
                            tooltip: 'Back',
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
