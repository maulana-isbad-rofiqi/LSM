import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kursus Saya", style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildProgressCard("Flutter for Beginners", 0.7),
          const SizedBox(height: 15),
          _buildProgressCard("UI/UX Mobile Design", 0.3),
        ],
      ),
    );
  }

  Widget _buildProgressCard(String title, double progress) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: progress, backgroundColor: Colors.grey[200], color: const Color(0xFF004684), minHeight: 8),
            const SizedBox(height: 8),
            Text("${(progress * 100).toInt()}% Selesai", style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}