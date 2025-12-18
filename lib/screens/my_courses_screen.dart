import 'package:flutter/material.dart';
import 'course_detail_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelas Saya")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          courseCard(context, "UI/UX Design", "Progress: 70%"),
          courseCard(context, "Pemrograman Mobile", "Progress: 45%"),
          courseCard(context, "Basis Data", "Progress: 90%"),
        ],
      ),
    );
  }

  Widget courseCard(BuildContext context, String title, String progress) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(progress),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CourseDetailScreen(title: title),
            ),
          );
        },
      ),
    );
  }
}
