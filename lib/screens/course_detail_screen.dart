import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  const CourseDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Kursus"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header Video Placeholder
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black87,
            child: const Icon(Icons.play_circle_fill, size: 100, color: Colors.white),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Text("Oleh: Maulana Isbad Rofiqi", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                const Text("Kurikulum Kursus", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),
                _buildLessonTile("1. Pendahuluan & Instalasi", true),
                _buildLessonTile("2. Struktur Folder & Main.dart", false),
                _buildLessonTile("3. Membuat Widget Pertama", false),
                _buildLessonTile("4. Navigasi Antar Halaman", false),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
          child: const Text("MULAI BELAJAR SEKARANG"),
        ),
      ),
    );
  }

  Widget _buildLessonTile(String title, bool isCompleted) {
    return ListTile(
      leading: Icon(isCompleted ? Icons.check_circle : Icons.play_circle_outline, 
                   color: isCompleted ? Colors.green : Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.lock_outline, size: 18),
      onTap: () {}, // Tambahkan navigasi ke video player jika perlu
    );
  }
}