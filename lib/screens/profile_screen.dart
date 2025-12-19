import 'package:flutter/material.dart';
import 'login_screen.dart';

// Color Constants
const Color primaryRed = Color(0xFFB91C1C);
const Color secondaryRed = Color(0xFF991B1B);
const Color accentRed = Color(0xFFDC2626);
const Color darkRed = Color(0xFF7F1D1D);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);
const Color backgroundLight = Color(0xFFF9FAFB);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildProfileHeader(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildStatsRow(),
                  const SizedBox(height: 24),
                  _buildMenuSection(context, "Akun", [
                    _MenuItem(Icons.person_rounded, "Edit Profil", Colors.blue, () => _showEditProfileDialog(context)),
                    _MenuItem(Icons.lock_rounded, "Ubah Password", Colors.orange, () {}),
                    _MenuItem(Icons.notifications_rounded, "Notifikasi", Colors.purple, () => _showNotificationSettingsDialog(context)),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection(context, "Akademik", [
                    _MenuItem(Icons.school_rounded, "Riwayat Akademik", Colors.green, () => _showAcademicHistoryDialog(context)),
                    _MenuItem(Icons.calendar_month_rounded, "Jadwal Kuliah", Colors.teal, () {}),
                    _MenuItem(Icons.assignment_rounded, "Transkrip Nilai", Colors.indigo, () {}),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection(context, "Lainnya", [
                    _MenuItem(Icons.help_rounded, "Bantuan", Colors.cyan, () {}),
                    _MenuItem(Icons.info_rounded, "Tentang Aplikasi", Colors.grey, () => _showAboutAppDialog(context)),
                    _MenuItem(Icons.logout_rounded, "Keluar", Colors.red, () => _showLogoutDialog(context)),
                  ]),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.logout_rounded, color: Colors.red, size: 24),
            ),
            const SizedBox(width: 12),
            const Text("Keluar", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          "Apakah Anda yakin ingin keluar dari aplikasi?",
          style: TextStyle(color: textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Batal", style: TextStyle(color: textMuted)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false, // Remove all previous routes
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text("Ya, Keluar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showAcademicHistoryDialog(BuildContext context) {
    final List<Map<String, dynamic>> semesters = [
      {
        "semester": "Semester 7 (Aktif)",
        "tahun": "2025/2026 Ganjil",
        "sks": 21,
        "ips": 3.85,
        "matkul": [
          {"nama": "UI/UX Design", "sks": 3, "nilai": "A"},
          {"nama": "Mobile Programming", "sks": 3, "nilai": "A-"},
          {"nama": "Machine Learning", "sks": 3, "nilai": "B+"},
          {"nama": "Cloud Computing", "sks": 3, "nilai": "A"},
          {"nama": "Sistem Terdistribusi", "sks": 3, "nilai": "A-"},
          {"nama": "Keamanan Siber", "sks": 3, "nilai": "B+"},
          {"nama": "Skripsi", "sks": 3, "nilai": "-"},
        ],
      },
      {
        "semester": "Semester 6",
        "tahun": "2024/2025 Genap",
        "sks": 21,
        "ips": 3.71,
        "matkul": [
          {"nama": "Pemrograman Web", "sks": 3, "nilai": "A"},
          {"nama": "Basis Data Lanjut", "sks": 3, "nilai": "A-"},
          {"nama": "Jaringan Komputer", "sks": 3, "nilai": "B+"},
          {"nama": "Rekayasa Perangkat Lunak", "sks": 3, "nilai": "A"},
          {"nama": "Kecerdasan Buatan", "sks": 3, "nilai": "B+"},
          {"nama": "Analisis Algoritma", "sks": 3, "nilai": "A-"},
          {"nama": "Interaksi Manusia Komputer", "sks": 3, "nilai": "A"},
        ],
      },
      {
        "semester": "Semester 5",
        "tahun": "2024/2025 Ganjil",
        "sks": 21,
        "ips": 3.65,
        "matkul": [
          {"nama": "Sistem Operasi", "sks": 3, "nilai": "A-"},
          {"nama": "Pemrograman Berorientasi Objek", "sks": 3, "nilai": "A"},
          {"nama": "Struktur Data", "sks": 3, "nilai": "B+"},
          {"nama": "Matematika Diskrit", "sks": 3, "nilai": "B+"},
          {"nama": "Statistika", "sks": 3, "nilai": "A-"},
          {"nama": "Bahasa Indonesia", "sks": 2, "nilai": "A"},
          {"nama": "Bahasa Inggris", "sks": 3, "nilai": "A"},
        ],
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.school_rounded, color: Colors.green, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Riwayat Akademik", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("Riwayat perkuliahan per semester", style: TextStyle(fontSize: 12, color: textMuted)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, color: textMuted),
                  ),
                ],
              ),
            ),
            // Summary Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.green, Colors.green.shade700]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryItem("IPK", "3.75", Icons.star_rounded),
                    Container(width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
                    _buildSummaryItem("Total SKS", "126", Icons.book_rounded),
                    Container(width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
                    _buildSummaryItem("Semester", "7", Icons.calendar_today_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey[200]),
            // Semester List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: semesters.length,
                itemBuilder: (context, index) {
                  final sem = semesters[index];
                  return _buildSemesterCard(sem, index == 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10)),
      ],
    );
  }

  Widget _buildSemesterCard(Map<String, dynamic> sem, bool isActive) {
    final matkul = sem["matkul"] as List;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(18),
        border: isActive ? Border.all(color: Colors.green, width: 2) : null,
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isActive ? Colors.green.withOpacity(0.15) : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.school_rounded, color: isActive ? Colors.green : Colors.grey, size: 22),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sem["semester"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isActive ? Colors.green : textMain)),
                    Text(sem["tahun"], style: TextStyle(fontSize: 11, color: textMuted)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("IPS: ${sem["ips"]}", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          children: [
            ...matkul.map((m) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(child: Text(m["nama"], style: const TextStyle(fontSize: 12, color: textMain))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getGradeColor(m["nilai"]).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(m["nilai"], style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _getGradeColor(m["nilai"]))),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    if (grade == "A" || grade == "A-") return Colors.green;
    if (grade == "B+" || grade == "B") return Colors.blue;
    if (grade == "B-" || grade == "C+") return Colors.orange;
    if (grade == "-") return Colors.grey;
    return Colors.red;
  }

  void _showNotificationSettingsDialog(BuildContext context) {
    bool tugasNotif = true;
    bool pengumumanNotif = true;
    bool nilaiNotif = true;
    bool reminderNotif = false;
    bool emailNotif = false;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              // Handle Bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.notifications_rounded, color: Colors.purple, size: 24),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pengaturan Notifikasi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                          Text("Atur preferensi notifikasi Anda", style: TextStyle(fontSize: 12, color: textMuted)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close_rounded, color: textMuted),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey[200]),
              // Settings List
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Push Notification", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain)),
                      const SizedBox(height: 16),
                      _buildNotifToggle(
                        "Tugas Baru",
                        "Notifikasi saat ada tugas baru",
                        Icons.assignment_rounded,
                        Colors.orange,
                        tugasNotif,
                        (val) => setModalState(() => tugasNotif = val),
                      ),
                      const SizedBox(height: 12),
                      _buildNotifToggle(
                        "Pengumuman",
                        "Notifikasi pengumuman kampus",
                        Icons.campaign_rounded,
                        Colors.blue,
                        pengumumanNotif,
                        (val) => setModalState(() => pengumumanNotif = val),
                      ),
                      const SizedBox(height: 12),
                      _buildNotifToggle(
                        "Nilai",
                        "Notifikasi saat nilai keluar",
                        Icons.grade_rounded,
                        Colors.green,
                        nilaiNotif,
                        (val) => setModalState(() => nilaiNotif = val),
                      ),
                      const SizedBox(height: 12),
                      _buildNotifToggle(
                        "Reminder Deadline",
                        "Pengingat sebelum deadline",
                        Icons.alarm_rounded,
                        Colors.red,
                        reminderNotif,
                        (val) => setModalState(() => reminderNotif = val),
                      ),
                      const SizedBox(height: 24),
                      const Text("Lainnya", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain)),
                      const SizedBox(height: 16),
                      _buildNotifToggle(
                        "Email Notification",
                        "Kirim notifikasi via email",
                        Icons.email_rounded,
                        Colors.teal,
                        emailNotif,
                        (val) => setModalState(() => emailNotif = val),
                      ),
                    ],
                  ),
                ),
              ),
              // Save Button
              Container(
                padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).padding.bottom + 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.check_circle_rounded, color: Colors.white),
                              const SizedBox(width: 12),
                              const Text("Pengaturan notifikasi disimpan!", style: TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                          backgroundColor: Colors.purple,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: const Text("Simpan Pengaturan", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotifToggle(String title, String subtitle, IconData icon, Color color, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: textMain)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: textMuted)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: color,
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final nameController = TextEditingController(text: "Maulana Isbad Rofiqi");
    final emailController = TextEditingController(text: "maulana@student.ac.id");
    final phoneController = TextEditingController(text: "08123456789");
    final addressController = TextEditingController(text: "Madura, Jawa Timur");

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.edit_rounded, color: Colors.blue, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Edit Profil", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("Perbarui informasi profil Anda", style: TextStyle(fontSize: 12, color: textMuted)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, color: textMuted),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[200]),
            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile Picture
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryRed, width: 3),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profil.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryRed,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Tap untuk ganti foto", style: TextStyle(fontSize: 12, color: textMuted)),
                    const SizedBox(height: 24),
                    // Form Fields
                    _buildEditField(nameController, "Nama Lengkap", Icons.person_rounded),
                    const SizedBox(height: 16),
                    _buildEditField(emailController, "Email", Icons.email_rounded),
                    const SizedBox(height: 16),
                    _buildEditField(phoneController, "No. Telepon", Icons.phone_rounded),
                    const SizedBox(height: 16),
                    _buildEditField(addressController, "Alamat", Icons.location_on_rounded),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            // Save Button
            Container(
              padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).padding.bottom + 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle_rounded, color: Colors.white),
                            const SizedBox(width: 12),
                            const Text("Profil berhasil diperbarui!", style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.all(16),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryRed,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Text("Simpan Perubahan", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField(TextEditingController controller, String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textMuted, fontSize: 14),
          prefixIcon: Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryRed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryRed, size: 20),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  void _showAboutAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryRed, secondaryRed],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: primaryRed.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.school_rounded, color: Colors.white, size: 40),
                  ),
                ),
                const SizedBox(height: 20),
                // App Name
                const Text(
                  "LMS App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textMain),
                ),
                const SizedBox(height: 4),
                Text(
                  "Learning Management System",
                  style: TextStyle(fontSize: 13, color: textMuted),
                ),
                const SizedBox(height: 16),
                // Version
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: primaryRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Versi 1.0.0",
                    style: TextStyle(color: primaryRed, fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 24),
                // Info
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.person_rounded, "Developer", "Maulana Isbad Rofiqi"),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.email_rounded, "Email", "maulana@student.ac.id"),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.school_rounded, "Universitas", "Universitas Islam Madura"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Copyright
                Text(
                  "© 2024 LMS App. All rights reserved.",
                  style: TextStyle(fontSize: 11, color: textMuted),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Close Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Tutup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryRed.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: primaryRed, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 10, color: textMuted)),
              Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textMain)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryRed, secondaryRed, darkRed],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
        boxShadow: [
          BoxShadow(color: primaryRed.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Profil Saya",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Profile Avatar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withOpacity(0.6)],
              ),
              boxShadow: [
                BoxShadow(color: Colors.white.withOpacity(0.3), blurRadius: 15, spreadRadius: 2),
              ],
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage("assets/images/profil.jpg"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Name
          const Text(
            "MAULANA ISBAD ROFIQI",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          const SizedBox(height: 6),
          // NIM
          Text(
            "NIM: 2022020100085",
            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13),
          ),
          const SizedBox(height: 12),
          // Badges
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBadge("MAHASISWA", Icons.school_rounded),
              const SizedBox(width: 10),
              _buildBadge("Semester 7", Icons.calendar_today_rounded),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard("21", "Total\nSKS", Icons.book_rounded, Colors.blue)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard("3.75", "IPK", Icons.star_rounded, Colors.orange)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard("7", "Mata\nKuliah", Icons.school_rounded, Colors.green)),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: textMuted, fontSize: 10, height: 1.3), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, String title, List<_MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item.icon, color: item.color, size: 22),
                    ),
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: textMuted),
                    onTap: item.onTap,
                  ),
                  if (index < items.length - 1)
                    Divider(height: 1, indent: 70, endIndent: 16, color: Colors.grey[200]),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  _MenuItem(this.icon, this.title, this.color, this.onTap);
}
