import 'package:flutter/material.dart';
// Ganti 'lms_app' di bawah ini sesuai nama proyek yang kamu buat di terminal tadi
import 'package:lms_app/screens/login_screen.dart'; 

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}