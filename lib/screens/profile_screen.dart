import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text("Maulana Isbad Rofiqi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("maulana.isbad@mhs.ac.id", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            
            // Menu-menu profil
            _buildProfileMenu(Icons.settings, "Pengaturan Akun"),
            _buildProfileMenu(Icons.workspace_premium, "Sertifikat Saya"),
            _buildProfileMenu(Icons.help_outline, "Pusat Bantuan"),
            const Spacer(),
            
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Keluar", style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}