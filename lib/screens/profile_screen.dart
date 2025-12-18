import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // SOLUSI OVERFLOW
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Color(0xFF004684),
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Maulana Isbad Rofiqi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("maulana.isbad@mhs.ac.id", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            _buildTile(Icons.settings, "Pengaturan Akun"),
            _buildTile(Icons.workspace_premium, "Sertifikat Saya"),
            _buildTile(Icons.help_outline, "Pusat Bantuan"),
            const Divider(indent: 20, endIndent: 20),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Keluar", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF004684)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}