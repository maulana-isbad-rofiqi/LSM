import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'my_courses_screen.dart';
import 'course_detail_screen.dart';
import 'notification_screen.dart'; // 1. Tambahkan import ini

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const MyCoursesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. Tambahkan AppBar di sini agar tombol notifikasi selalu ada
      appBar: AppBar(
        title: const Text(
          "CeLoe LMS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF004684)),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF004684)),
            onPressed: () {
              // 3. Fungsikan Navigasi ke Halaman Notifikasi
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF004684),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: "Belajar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profil"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Selamat Datang,", style: TextStyle(fontSize: 16, color: Colors.grey)),
          const Text("Maulana Isbad", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: "Cari Kursus...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), 
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text("Kursus Populer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _buildCourseItem(context, "Flutter for Beginners", "9 Modul", Colors.blue),
          _buildCourseItem(context, "UI/UX Mobile Design", "12 Modul", Colors.orange),
          _buildCourseItem(context, "Backend with Dart", "8 Modul", Colors.green),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCourseItem(BuildContext context, String title, String mod, Color col) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), 
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        leading: Icon(Icons.play_circle_fill, color: col, size: 45),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(mod),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => CourseDetailScreen(title: title)),
          );
        },
      ),
    );
  }
}