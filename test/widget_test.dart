import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_app/main.dart';

void main() {
  testWidgets('LMS App smoke test', (WidgetTester tester) async {
    // Jalankan aplikasi
    await tester.pumpWidget(const LMSApp());

    // Pastikan halaman Login tampil
    expect(find.text('Login'), findsOneWidget);

    // Pastikan ada TextField (email & password)
    expect(find.byType(TextField), findsWidgets);

    // Pastikan tombol login ada
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
