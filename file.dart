import 'package:flutter/material.dart';

// الدالة الرئيسية اللي بيبدأ منها التطبيق
void main() {
  runApp(const MyApp());
}

// الكلاس الأساسي للتطبيق
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // بنشيل علامة الـ debug اللي بتظهر فوق على اليمين
      debugShowCheckedModeBanner: false,
      title: 'Simple Routing',
      // بنحدد إن الصفحة الأولى اللي هتفتح هي HomePage
      home: const HomePage(),
    );
  }
}

// الصفحة الأولى (HomePage)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold هو الهيكل الأساسي للصفحة (الشريط العلوي ومكان المحتوى)
    return Scaffold(
      // الشريط العلوي (AppBar)
      appBar: AppBar(
        title: const Text('First Page (Home)'),
      ),
      // بنستخدم Center عشان نحط المحتوى في نص الشاشة
      body: Center(
        // زرار بسيط، لما بندوس عليه بينقلنا للصفحة التانية
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push بتستخدم للانتقال لصفحة جديدة
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}

// الصفحة التانية (SecondPage)
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الشريط العلوي للصفحة التانية
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        // Column بيرتب العناصر فوق بعضها (رأسياً)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // رسالة عادية جداً
            const Text(
              'You have successfully navigated to the second page.\n\nThis demonstrates basic routing in Flutter.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // مسافة فاضية بين النص والزرار
            // زرار الرجوع (تصميم عادي جداً)
            OutlinedButton(
              onPressed: () {
                // Navigator.pop بترجعنا للصفحة اللي قبلها (يعني للصفحة الأولى)
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}