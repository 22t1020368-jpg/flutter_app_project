import 'package:flutter/material.dart';
import 'travel_screen.dart';
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
  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const RootLayout(),
        '/booking': (context) => const BookingMockScreen(),
        '/classroom': (context) => const ClassroomScreen(),
        '/myplace': (context) => const MyPlace(),
        '/homepage': (context) => const MyHomePage(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/counter': (context) => const CounterScreen(),
        '/countdown': (context) => const CountdownTimerScreen(),
        '/color': (context) => const ChangeColorApp(),
        '/bmi': (context) => BMIScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/product': (context) => const MyProduct(),
        '/news': (context) => const NewsListScreen(),
        '/login-api': (context) => const LoginApiScreen(),
        '/travel': (context) => Travelapp(),
      },
    );
  }
}

// ================= ROOT =================
class RootLayout extends StatefulWidget {
  const RootLayout({super.key});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  final List<Map<String, dynamic>> lessons = [
    {'title': 'Booking Mock', 'icon': Icons.event, 'route': '/booking', 'image': 'assets/images/booking.jpg'},
    {'title': 'Classroom', 'icon': Icons.class_, 'route': '/classroom', 'image': 'assets/images/lophoc.png'},
    {'title': 'My Place', 'icon': Icons.place, 'route': '/myplace', 'image': 'assets/images/myplace.png'},
    {'title': 'Home Page', 'icon': Icons.home, 'route': '/homepage', 'image': 'assets/images/myhomepage.png'},
    {'title': 'Login', 'icon': Icons.login, 'route': '/login', 'image': 'assets/images/login.png'},
    {'title': 'Register', 'icon': Icons.app_registration, 'route': '/register', 'image': 'assets/images/dangki.jpg'},
    {'title': 'Counter', 'icon': Icons.add_circle, 'route': '/counter', 'image': 'assets/images/dmeso.png'},
    {'title': 'Countdown', 'icon': Icons.timer, 'route': '/countdown', 'image': 'assets/images/demtime.jpg'},
    {'title': 'Change Color', 'icon': Icons.color_lens, 'route': '/color', 'image': 'assets/images/anhmau.png'},
    {'title': 'BMI', 'icon': Icons.monitor_weight, 'route': '/bmi', 'image': 'assets/images/bmi.png'},
    {'title': 'Feedback', 'icon': Icons.feedback, 'route': '/feedback', 'image': 'assets/images/feedback.png'},
    {'title': 'Product', 'icon': Icons.shopping_cart, 'route': '/product', 'image': 'assets/images/listproduct.png'},
    {'title': 'News', 'icon': Icons.newspaper, 'route': '/news', 'image': 'assets/images/news.png'},
    {'title': 'Login API', 'icon': Icons.api, 'route': '/login-api', 'image': 'assets/images/loginapi.png'},
    {'title': 'Travel', 'icon': Icons.api, 'route': '/travel', 'image': 'assets/images/charlie.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f4f6),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 900;
          double contentWidth = isSmallScreen ? constraints.maxWidth : constraints.maxWidth - 372;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: isSmallScreen
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileCard(),
                        const SizedBox(height: 30),
                        // ===== TIÊU ĐỀ Ở ĐÂY (Màn hình nhỏ) =====
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Danh sách bài tập",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _lessonGrid(isSmallScreen: true, maxWidth: contentWidth, context: context),
                        const SizedBox(height: 30),
                      ],
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 340, child: _profileCard()),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ===== TIÊU ĐỀ Ở ĐÂY (Màn hình lớn) =====
                            const Padding(
                              padding: EdgeInsets.only(bottom: 20, top: 10),
                              child: Text(
                                "Danh sách bài tập",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                            Expanded(
                              child: _lessonGrid(
                                isSmallScreen: false,
                                maxWidth: contentWidth,
                                context: context,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  // ================= PROFILE =================
  Widget _profileCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/anhprofile.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Nguyễn Đăng Quốc',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 6),
            Center(
              child: Text(
                'Flutter Mobile & Web Developer',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 16),
            Text('🎓 Sinh viên CNTT'),
            SizedBox(height: 8),
            Text('🏫 Lập trình ứng dụng di động'),
            SizedBox(height: 8),
            Text('📧 22T1020368@husc.edu.vn'),
            SizedBox(height: 20),
            Text('🛠 Kỹ năng', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('• Flutter UI & Navigation'),
            Text('• REST API cơ bản'),
            Text('• Flutter Web'),
          ],
        ),
      ),
    );
  }

  Widget _lessonGrid({bool isSmallScreen = false, double maxWidth = 800, required BuildContext context}) {
    int crossAxisCount = isSmallScreen ? 1 : (maxWidth / 260).floor();
    if (crossAxisCount < 1) crossAxisCount = 1;

    double aspectRatio = isSmallScreen ? 1.4 : 1.05;
    return GridView.builder(
      shrinkWrap: isSmallScreen, 
      physics: isSmallScreen ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
      itemCount: lessons.length,
      padding: const EdgeInsets.only(bottom: 20), 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = lessons[index];
        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => Navigator.pushNamed(context, item['route']),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image'],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                     Icon(item['icon'], size: 22, color: Colors.indigo),
                     const SizedBox(width: 8),
                     Expanded(
                       child: Text(
                         item['title'],
                         style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Xem ngay', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }
}