import 'package:flutter/material.dart';
import 'course_detail_screen.dart'; 
import 'profile_screen.dart';       
import 'my_courses_screen.dart'; // Tambahkan file baru ini untuk menu "Belajar"

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List halaman agar navigasi bawah terasa lebih halus (Smooth)
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomeContent(),     // Index 0: Tampilan Beranda
      const MyCoursesScreen(), // Index 1: Tampilan Belajar
      const ProfileScreen(),   // Index 2: Tampilan Profil
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LMS Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      // Menggunakan IndexedStack agar posisi scroll di setiap halaman tidak hilang
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: "Belajar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profil"),
        ],
      ),
    );
  }

  // Pindahkan konten beranda ke fungsi terpisah agar kode rapi
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Selamat Datang,", style: TextStyle(fontSize: 16, color: Colors.grey)),
          const Text("Maulana Isbad", 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          
          TextField(
            decoration: InputDecoration(
              hintText: "Cari Kursus...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 25),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Kursus Populer", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("Lihat Semua")),
            ],
          ),
          const SizedBox(height: 10),

          _buildCourseItem(context, "Flutter for Beginners", "9 Modul", Colors.blue),
          _buildCourseItem(context, "UI/UX Mobile Design", "12 Modul", Colors.orange),
          _buildCourseItem(context, "Backend with Dart", "8 Modul", Colors.green),
        ],
      ),
    );
  }

  Widget _buildCourseItem(BuildContext context, String title, String info, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1), 
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(Icons.play_lesson_rounded, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(info),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () {
          // Navigasi ke Detail tetap menggunakan push karena ini halaman baru
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