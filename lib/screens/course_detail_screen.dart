import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Kursus")),
      body: ListView(
        children: [
          Container(
            height: 220,
            color: Colors.black,
            child: const Icon(Icons.play_circle_outline, color: Colors.white, size: 80),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Kurikulum Mata Kuliah", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                _buildLesson("1. Pendahuluan"),
                _buildLesson("2. Dasar-dasar Teori"),
                _buildLesson("3. Implementasi Projek"),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004684),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: const Text("MULAI BELAJAR"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLesson(String name) {
    return ListTile(
      leading: const Icon(Icons.lock_open, color: Colors.blue),
      title: Text(name),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}