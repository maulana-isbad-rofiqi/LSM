import 'package:flutter/material.dart';
import 'quiz_screen.dart';

const Color primaryRed = Color(0xFFB84545);

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: primaryRed,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Daftar Materi",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          materiTile("Pengenalan"),
          materiTile("User Interface"),
          materiTile("User Experience"),

          const SizedBox(height: 20),

          // 🔥 TOMBOL QUIZ
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text(
                "Mulai Quiz",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuizScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 📦 CARD MATERI
  Widget materiTile(String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.play_circle_fill,
          color: primaryRed,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
    );
  }
}
