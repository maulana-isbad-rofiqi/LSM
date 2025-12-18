import 'package:flutter/material.dart';
import 'course_detail_screen.dart'; // Pastikan file ini sudah dibuat
import 'profile_screen.dart';       // Pastikan file ini sudah dibuat

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk melacak menu yang aktif
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Logika pindah ke halaman Profil jika index ke-2 diklik
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

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
            const Text("Maulana Isbad", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            TextField(
              decoration: InputDecoration(
                hintText: "Cari Kursus...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 25),
            
            const Text("Kursus Populer", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Memanggil fungsi build dengan navigasi asli
            _buildCourseItem(context, "Flutter for Beginners", "9 Modul", Colors.blue),
            _buildCourseItem(context, "UI/UX Mobile Design", "12 Modul", Colors.orange),
            _buildCourseItem(context, "Backend with Dart", "8 Modul", Colors.green),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Menggunakan variabel state
        onTap: _onItemTapped,        // Fungsi untuk mengubah state
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Belajar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  Widget _buildCourseItem(BuildContext context, String title, String info, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2), 
            borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(Icons.play_lesson, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(info),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // PERBAIKAN: Sekarang benar-benar pindah halaman, bukan cuma SnackBar
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailScreen(title: title),
            ),
          );
        },
      ),
    );
  }
}