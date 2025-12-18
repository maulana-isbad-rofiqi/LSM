import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifikasi")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Tugas baru tersedia"),
            subtitle: Text("UI/UX Design"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Quiz dibuka"),
            subtitle: Text("Pemrograman Mobile"),
          ),
        ],
      ),
    );
  }
}
