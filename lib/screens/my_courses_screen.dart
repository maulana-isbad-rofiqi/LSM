import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kursus Saya")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressCard("Flutter for Beginners", 0.7),
          _buildProgressCard("UI/UX Mobile Design", 0.3),
        ],
      ),
    );
  }

  Widget _buildProgressCard(String title, double progress) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: Colors.blue,
              minHeight: 8,
            ),
            const SizedBox(height: 5),
            Text("${(progress * 100).toInt()}% Selesai", style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}