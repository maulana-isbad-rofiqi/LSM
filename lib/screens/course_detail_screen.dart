import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            color: Colors.blueGrey[100],
            child: const Icon(Icons.play_circle_fill, size: 80, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("Instruktur: Maulana Isbad"),
          const Divider(height: 40),
          const Text("Daftar Materi:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildLessonItem("1. Pengenalan Dasar"),
          _buildLessonItem("2. Instalasi Tools"),
          _buildLessonItem("3. Struktur Project"),
        ],
      ),
    );
  }

  Widget _buildLessonItem(String lesson) {
    return ListTile(
      leading: const Icon(Icons.check_circle_outline),
      title: Text(lesson),
      trailing: const Icon(Icons.lock_outline),
    );
  }
}