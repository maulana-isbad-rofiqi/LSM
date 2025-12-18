import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF004684),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildNotifItem(
            "Materi Baru!", 
            "Dosen telah mengunggah materi pertemuan 5.", 
            Icons.book_online, 
            Colors.blue
          ),
          _buildNotifItem(
            "Pengingat Tugas", 
            "Tugas Pemrograman Mobile akan berakhir besok.", 
            Icons.warning_amber_rounded, 
            Colors.orange
          ),
          _buildNotifItem(
            "Ujian Berhasil", 
            "Selamat! Anda lulus kuis Basis Data.", 
            Icons.check_circle_outline, 
            Colors.green
          ),
        ],
      ),
    );
  }

  Widget _buildNotifItem(String title, String desc, IconData icon, Color color) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        onTap: () {}, // Bisa diklik
      ),
    );
  }
}