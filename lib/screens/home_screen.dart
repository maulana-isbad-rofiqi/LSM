import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard LMS"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Halo, Selamat Belajar!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // Contoh Kartu Kursus yang bisa diklik
          GestureDetector(
            onTap: () {
              print("Kursus diklik!"); // Nanti hubungkan ke halaman detail
            },
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.blue),
                title: const Text("Flutter Mobile Development"),
                subtitle: const Text("Progress: 50%"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ],
      ),
      // Menu Bawah (Navigasi)
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "My Course"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}