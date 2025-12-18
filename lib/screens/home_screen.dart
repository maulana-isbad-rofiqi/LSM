import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LMS Dashboard"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang,", style: TextStyle(fontSize: 16)),
            const Text("Maulana Isbad", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            // Search Bar (Hanya Tampilan)
            TextField(
              decoration: InputDecoration(
                hintText: "Cari Kursus...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 25),
            
            const Text("Kursus Populer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Daftar Kursus (Bisa Diklik)
            _buildCourseItem(context, "Flutter for Beginners", "9 Modul", Colors.blue),
            _buildCourseItem(context, "UI/UX Mobile Design", "12 Modul", Colors.orange),
            _buildCourseItem(context, "Backend with Dart", "8 Modul", Colors.green),
          ],
        ),
      ),
      
      // Navigasi Bawah (Bisa Diklik untuk pindah menu)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Belajar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        onTap: (index) {
          // Logika pindah menu bisa ditambahkan di sini nanti
          print("Pindah ke menu index: $index");
        },
      ),
    );
  }

  // Widget pendukung untuk membuat item kursus agar kode rapi
  Widget _buildCourseItem(BuildContext context, String title, String info, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.play_lesson, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(info),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Fungsi Klik: Tampilkan pesan atau pindah ke halaman detail
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Membuka kursus: $title")),
          );
        },
      ),
    );
  }
}