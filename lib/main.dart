import 'package:flutter/material.dart';
import 'package:lms_app/screens/login_screen.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLoe LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Menggunakan warna Biru Navy khas CeLoe
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004684)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}