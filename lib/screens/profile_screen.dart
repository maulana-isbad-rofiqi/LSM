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
                    _MenuItem(Icons.lock_rounded, "Ubah Password", Colors.orange, () => _showChangePasswordDialog(context)),
                    _MenuItem(Icons.notifications_rounded, "Notifikasi", Colors.purple, () => _showNotificationSettingsDialog(context)),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection(context, "Akademik", [
                    _MenuItem(Icons.school_rounded, "Riwayat Akademik", Colors.green, () => _showAcademicHistoryDialog(context)),
                    _MenuItem(Icons.calendar_month_rounded, "Jadwal Kuliah", Colors.teal, () => _showScheduleDialog(context)),
                    _MenuItem(Icons.assignment_rounded, "Transkrip Nilai", Colors.indigo, () => _showTranscriptDialog(context)),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection(context, "Lainnya", [
                    _MenuItem(Icons.help_rounded, "Bantuan", Colors.cyan, () => _showHelpDialog(context)),
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

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    bool obscureOld = true;
    bool obscureNew = true;
    bool obscureConfirm = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
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
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.lock_rounded, color: Colors.orange, size: 24),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ubah Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                          Text("Ganti password akun Anda", style: TextStyle(fontSize: 12, color: textMuted)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Info Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.orange.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_rounded, color: Colors.orange, size: 24),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Password harus minimal 8 karakter dengan kombinasi huruf dan angka.",
                                style: TextStyle(fontSize: 12, color: Colors.orange.shade800, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Old Password
                      _buildPasswordField(
                        controller: oldPasswordController,
                        label: "Password Lama",
                        icon: Icons.lock_outline_rounded,
                        obscure: obscureOld,
                        onToggle: () => setModalState(() => obscureOld = !obscureOld),
                      ),
                      const SizedBox(height: 20),
                      // New Password
                      _buildPasswordField(
                        controller: newPasswordController,
                        label: "Password Baru",
                        icon: Icons.lock_rounded,
                        obscure: obscureNew,
                        onToggle: () => setModalState(() => obscureNew = !obscureNew),
                      ),
                      const SizedBox(height: 20),
                      // Confirm Password
                      _buildPasswordField(
                        controller: confirmPasswordController,
                        label: "Konfirmasi Password Baru",
                        icon: Icons.lock_clock_rounded,
                        obscure: obscureConfirm,
                        onToggle: () => setModalState(() => obscureConfirm = !obscureConfirm),
                      ),
                      const SizedBox(height: 24),
                      // Password Strength Indicator
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: backgroundLight,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Syarat Password:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textMain)),
                            const SizedBox(height: 12),
                            _buildPasswordRequirement("Minimal 8 karakter", true),
                            _buildPasswordRequirement("Mengandung huruf besar", false),
                            _buildPasswordRequirement("Mengandung huruf kecil", true),
                            _buildPasswordRequirement("Mengandung angka", false),
                          ],
                        ),
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
                      // Validate passwords
                      if (oldPasswordController.text.isEmpty ||
                          newPasswordController.text.isEmpty ||
                          confirmPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.error_rounded, color: Colors.white),
                                const SizedBox(width: 12),
                                const Text("Harap isi semua field!", style: TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.all(16),
                          ),
                        );
                        return;
                      }
                      if (newPasswordController.text != confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.error_rounded, color: Colors.white),
                                const SizedBox(width: 12),
                                const Text("Password baru tidak cocok!", style: TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.all(16),
                          ),
                        );
                        return;
                      }
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.check_circle_rounded, color: Colors.white),
                              const SizedBox(width: 12),
                              const Text("Password berhasil diubah!", style: TextStyle(fontWeight: FontWeight.w500)),
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
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: const Text("Ubah Password", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 15, color: textMain),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textMuted, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.orange, size: 22),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscure ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              color: textMuted,
              size: 22,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isMet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle_rounded : Icons.circle_outlined,
            color: isMet ? Colors.green : textMuted,
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isMet ? Colors.green : textMuted,
              fontWeight: isMet ? FontWeight.w600 : FontWeight.normal,
            ),
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

  void _showScheduleDialog(BuildContext context) {
    final List<Map<String, dynamic>> scheduleData = [
      {
        "hari": "Senin",
        "jadwal": [
          {"waktu": "08:00 - 09:40", "matkul": "UI/UX Design", "ruang": "Lab A.101", "dosen": "Dr. Ahmad Fauzi, M.Kom"},
          {"waktu": "10:00 - 11:40", "matkul": "Mobile Programming", "ruang": "Lab B.201", "dosen": "Prof. Siti Nurhaliza, Ph.D"},
        ],
      },
      {
        "hari": "Selasa",
        "jadwal": [
          {"waktu": "08:00 - 09:40", "matkul": "Machine Learning", "ruang": "Lab C.301", "dosen": "Dr. Budi Santoso, M.T"},
          {"waktu": "13:00 - 14:40", "matkul": "Cloud Computing", "ruang": "R. 305", "dosen": "Dr. Rina Wulandari, M.Kom"},
        ],
      },
      {
        "hari": "Rabu",
        "jadwal": [
          {"waktu": "10:00 - 11:40", "matkul": "Sistem Terdistribusi", "ruang": "R. 202", "dosen": "Dr. Hendra Kusuma, M.Sc"},
        ],
      },
      {
        "hari": "Kamis",
        "jadwal": [
          {"waktu": "08:00 - 09:40", "matkul": "Keamanan Siber", "ruang": "Lab D.102", "dosen": "Dr. Dewi Sartika, M.Kom"},
          {"waktu": "13:00 - 14:40", "matkul": "Skripsi", "ruang": "R. Dosen", "dosen": "Dr. Ahmad Fauzi, M.Kom"},
        ],
      },
      {
        "hari": "Jumat",
        "jadwal": [
          {"waktu": "08:00 - 10:30", "matkul": "Praktikum Mobile", "ruang": "Lab B.201", "dosen": "Asisten Lab"},
        ],
      },
    ];

    // Get today's day name in Indonesian
    final List<String> dayNames = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
    final String today = dayNames[DateTime.now().weekday % 7];

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
                      color: Colors.teal.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.calendar_month_rounded, color: Colors.teal, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jadwal Kuliah", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("Semester 7 - 2025/2026 Ganjil", style: TextStyle(fontSize: 12, color: textMuted)),
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
            // Today Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.teal, Colors.teal.shade700]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.today_rounded, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hari Ini - $today",
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _getTodayScheduleInfo(scheduleData, today),
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey[200]),
            // Schedule List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: scheduleData.length,
                itemBuilder: (context, index) {
                  final day = scheduleData[index];
                  final isToday = day["hari"] == today;
                  return _buildDayScheduleCard(day, isToday);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTodayScheduleInfo(List<Map<String, dynamic>> data, String today) {
    for (var day in data) {
      if (day["hari"] == today) {
        final jadwal = day["jadwal"] as List;
        return "${jadwal.length} mata kuliah hari ini";
      }
    }
    return "Tidak ada jadwal hari ini";
  }

  Widget _buildDayScheduleCard(Map<String, dynamic> day, bool isToday) {
    final jadwal = day["jadwal"] as List;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(18),
        border: isToday ? Border.all(color: Colors.teal, width: 2) : null,
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isToday,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isToday ? Colors.teal.withOpacity(0.15) : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.calendar_today_rounded,
              color: isToday ? Colors.teal : Colors.grey,
              size: 22,
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          day["hari"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: isToday ? Colors.teal : textMain,
                          ),
                        ),
                        if (isToday) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "HARI INI",
                              style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      "${jadwal.length} mata kuliah",
                      style: TextStyle(fontSize: 11, color: textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          children: [
            ...jadwal.map((j) => _buildScheduleItem(j)),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time_rounded, color: Colors.teal, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      item["waktu"],
                      style: const TextStyle(color: Colors.teal, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.room_rounded, color: Colors.indigo, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      item["ruang"],
                      style: const TextStyle(color: Colors.indigo, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item["matkul"],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textMain),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.person_rounded, color: textMuted, size: 14),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item["dosen"],
                  style: TextStyle(fontSize: 11, color: textMuted),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showTranscriptDialog(BuildContext context) {
    final List<Map<String, dynamic>> transcriptData = [
      {"kode": "IF101", "nama": "Pengantar Teknologi Informasi", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF102", "nama": "Algoritma & Pemrograman", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF103", "nama": "Kalkulus", "sks": 3, "nilai": "B+", "bobot": 3.5},
      {"kode": "IF104", "nama": "Fisika Dasar", "sks": 2, "nilai": "A-", "bobot": 3.75},
      {"kode": "IF201", "nama": "Struktur Data", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF202", "nama": "Basis Data", "sks": 3, "nilai": "A-", "bobot": 3.75},
      {"kode": "IF203", "nama": "Sistem Operasi", "sks": 3, "nilai": "B+", "bobot": 3.5},
      {"kode": "IF204", "nama": "Jaringan Komputer", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF301", "nama": "Pemrograman Web", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF302", "nama": "Pemrograman Berorientasi Objek", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF303", "nama": "Rekayasa Perangkat Lunak", "sks": 3, "nilai": "A-", "bobot": 3.75},
      {"kode": "IF304", "nama": "Kecerdasan Buatan", "sks": 3, "nilai": "B+", "bobot": 3.5},
      {"kode": "IF401", "nama": "UI/UX Design", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF402", "nama": "Mobile Programming", "sks": 3, "nilai": "A-", "bobot": 3.75},
      {"kode": "IF403", "nama": "Machine Learning", "sks": 3, "nilai": "B+", "bobot": 3.5},
      {"kode": "IF404", "nama": "Cloud Computing", "sks": 3, "nilai": "A", "bobot": 4.0},
      {"kode": "IF405", "nama": "Sistem Terdistribusi", "sks": 3, "nilai": "A-", "bobot": 3.75},
      {"kode": "IF406", "nama": "Keamanan Siber", "sks": 3, "nilai": "B+", "bobot": 3.5},
    ];

    // Calculate totals
    int totalSKS = 0;
    double totalBobot = 0;
    int nilaiA = 0, nilaiB = 0, nilaiC = 0;

    for (var mk in transcriptData) {
      totalSKS += mk["sks"] as int;
      totalBobot += (mk["sks"] as int) * (mk["bobot"] as double);
      if (mk["nilai"].toString().startsWith("A")) nilaiA++;
      else if (mk["nilai"].toString().startsWith("B")) nilaiB++;
      else nilaiC++;
    }

    double ipk = totalBobot / totalSKS;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
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
                      color: Colors.indigo.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.assignment_rounded, color: Colors.indigo, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transkrip Nilai", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("Rekap nilai seluruh mata kuliah", style: TextStyle(fontSize: 12, color: textMuted)),
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.indigo, Colors.indigo.shade800]),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.indigo.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTranscriptSummary("IPK", ipk.toStringAsFixed(2), Icons.star_rounded),
                        Container(width: 1, height: 50, color: Colors.white.withOpacity(0.2)),
                        _buildTranscriptSummary("Total SKS", totalSKS.toString(), Icons.book_rounded),
                        Container(width: 1, height: 50, color: Colors.white.withOpacity(0.2)),
                        _buildTranscriptSummary("Mata Kuliah", transcriptData.length.toString(), Icons.school_rounded),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildGradeCount("A", nilaiA, Colors.green),
                          _buildGradeCount("B", nilaiB, Colors.blue),
                          _buildGradeCount("C", nilaiC, Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Table Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 30, child: Text("No", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo), textAlign: TextAlign.center)),
                    const SizedBox(width: 8),
                    SizedBox(width: 55, child: Text("Kode", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo))),
                    const SizedBox(width: 8),
                    Expanded(child: Text("Mata Kuliah", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo))),
                    SizedBox(width: 35, child: Text("SKS", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo), textAlign: TextAlign.center)),
                    const SizedBox(width: 8),
                    SizedBox(width: 45, child: Text("Nilai", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo), textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Transcript List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: transcriptData.length,
                itemBuilder: (context, index) {
                  final mk = transcriptData[index];
                  return _buildTranscriptItem(mk, index);
                },
              ),
            ),
            // Download Button
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
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.download_rounded, color: Colors.white),
                            const SizedBox(width: 12),
                            const Text("Transkrip nilai sedang diunduh...", style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        backgroundColor: Colors.indigo,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.all(16),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download_rounded, color: Colors.white),
                  label: const Text("Unduh Transkrip PDF", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranscriptSummary(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10)),
      ],
    );
  }

  Widget _buildGradeCount(String grade, int count, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(grade, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 8),
        Text("$count MK", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildTranscriptItem(Map<String, dynamic> mk, int index) {
    Color gradeColor;
    String nilai = mk["nilai"];
    if (nilai.startsWith("A")) {
      gradeColor = Colors.green;
    } else if (nilai.startsWith("B")) {
      gradeColor = Colors.blue;
    } else if (nilai.startsWith("C")) {
      gradeColor = Colors.orange;
    } else {
      gradeColor = Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: index.isEven ? backgroundLight : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          // Nomor
          Container(
            width: 30,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Kode
          SizedBox(
            width: 55,
            child: Text(
              mk["kode"],
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.indigo.shade700),
            ),
          ),
          const SizedBox(width: 8),
          // Nama Mata Kuliah
          Expanded(
            child: Text(
              mk["nama"],
              style: const TextStyle(fontSize: 12, color: textMain, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // SKS
          SizedBox(
            width: 35,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                mk["sks"].toString(),
                style: const TextStyle(fontSize: 11, color: textMain, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Nilai
          SizedBox(
            width: 45,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: gradeColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: gradeColor.withOpacity(0.3), width: 1),
              ),
              child: Text(
                nilai,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: gradeColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    final List<Map<String, dynamic>> faqItems = [
      {
        "question": "Bagaimana cara melihat jadwal kuliah?",
        "answer": "Buka menu Profil, lalu pilih 'Jadwal Kuliah' pada bagian Akademik. Anda dapat melihat jadwal perkuliahan per hari.",
      },
      {
        "question": "Bagaimana cara mengunduh transkrip nilai?",
        "answer": "Buka menu Profil, pilih 'Transkrip Nilai', lalu klik tombol 'Unduh Transkrip PDF' di bagian bawah.",
      },
      {
        "question": "Bagaimana cara mengikuti kuis?",
        "answer": "Pilih mata kuliah yang ingin diikuti kuisnya, lalu pilih kuis yang tersedia dan klik 'Mulai Kuis'.",
      },
      {
        "question": "Bagaimana cara mengubah password?",
        "answer": "Buka menu Profil, pilih 'Ubah Password' pada bagian Akun, lalu ikuti langkah-langkah yang ditampilkan.",
      },
      {
        "question": "Bagaimana cara menghubungi dosen?",
        "answer": "Buka halaman detail mata kuliah, di sana terdapat informasi kontak dosen pengampu.",
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
                      color: Colors.cyan.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.help_rounded, color: Colors.cyan, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pusat Bantuan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("FAQ & Panduan Penggunaan", style: TextStyle(fontSize: 12, color: textMuted)),
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
            // Contact Support Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan.shade700]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Butuh Bantuan Lebih?",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hubungi: support@lms.ac.id",
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Hubungi",
                        style: TextStyle(color: Colors.cyan, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.quiz_rounded, color: Colors.cyan, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "Pertanyaan yang Sering Diajukan (FAQ)",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // FAQ List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: faqItems.length,
                itemBuilder: (context, index) {
                  final faq = faqItems[index];
                  return _buildFaqItem(faq, index);
                },
              ),
            ),
            // Quick Actions
            Container(
              padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).padding.bottom + 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showGuideDialog(context);
                      },
                      icon: const Icon(Icons.book_rounded, size: 18),
                      label: const Text("Panduan", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.cyan,
                        side: const BorderSide(color: Colors.cyan, width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _showLiveChatDialog(context);
                      },
                      icon: const Icon(Icons.chat_rounded, color: Colors.white, size: 18),
                      label: const Text("Live Chat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGuideDialog(BuildContext context) {
    final List<Map<String, dynamic>> guideItems = [
      {
        "title": "Navigasi Aplikasi",
        "icon": Icons.explore_rounded,
        "color": Colors.blue,
        "steps": [
          "Gunakan menu navigasi di bagian bawah untuk berpindah halaman",
          "Tab Home: Lihat dashboard dan ringkasan kursus",
          "Tab Kelas Saya: Akses semua mata kuliah Anda",
          "Tab Notifikasi: Lihat pemberitahuan terbaru",
          "Tab Profil: Kelola akun dan pengaturan",
        ],
      },
      {
        "title": "Mengikuti Kuis",
        "icon": Icons.quiz_rounded,
        "color": Colors.orange,
        "steps": [
          "Pilih mata kuliah dari halaman Kelas Saya",
          "Scroll ke bagian Kuis pada detail kursus",
          "Pilih kuis yang ingin dikerjakan",
          "Klik 'Mulai Kuis' untuk memulai",
          "Jawab semua pertanyaan dan submit",
        ],
      },
      {
        "title": "Melihat Jadwal & Nilai",
        "icon": Icons.calendar_month_rounded,
        "color": Colors.teal,
        "steps": [
          "Buka halaman Profil",
          "Pilih 'Jadwal Kuliah' untuk melihat jadwal",
          "Pilih 'Transkrip Nilai' untuk melihat nilai",
          "Gunakan 'Riwayat Akademik' untuk detail semester",
        ],
      },
      {
        "title": "Mengelola Akun",
        "icon": Icons.person_rounded,
        "color": Colors.purple,
        "steps": [
          "Buka halaman Profil",
          "Pilih 'Edit Profil' untuk mengubah data diri",
          "Pilih 'Ubah Password' untuk keamanan akun",
          "Atur notifikasi sesuai preferensi Anda",
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
                      color: Colors.indigo.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.menu_book_rounded, color: Colors.indigo, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Panduan Penggunaan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                        Text("Cara menggunakan aplikasi LMS", style: TextStyle(fontSize: 12, color: textMuted)),
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
            // Guide List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: guideItems.length,
                itemBuilder: (context, index) {
                  final guide = guideItems[index];
                  return _buildGuideCard(guide);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard(Map<String, dynamic> guide) {
    final steps = guide["steps"] as List<String>;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (guide["color"] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(guide["icon"], color: guide["color"], size: 24),
          ),
          title: Text(
            guide["title"],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textMain),
          ),
          children: [
            ...steps.asMap().entries.map((entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: (guide["color"] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "${entry.key + 1}",
                        style: TextStyle(color: guide["color"], fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: TextStyle(fontSize: 13, color: textMuted, height: 1.4),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _showLiveChatDialog(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final List<Map<String, dynamic>> chatMessages = [
      {"isBot": true, "message": "Halo! 👋 Selamat datang di Live Chat LMS. Saya adalah asisten virtual yang siap membantu Anda.", "time": "Baru saja"},
      {"isBot": true, "message": "Silakan ketik pertanyaan Anda, dan saya akan berusaha membantu sebaik mungkin.", "time": "Baru saja"},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan.shade700]),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Live Chat Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text("Online", style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.9))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Chat Messages
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final msg = chatMessages[index];
                    return _buildChatBubble(msg["isBot"], msg["message"], msg["time"]);
                  },
                ),
              ),
              // Quick Replies
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildQuickReply("Lupa Password", () {
                      setModalState(() {
                        chatMessages.add({"isBot": false, "message": "Lupa Password", "time": "Baru saja"});
                        chatMessages.add({"isBot": true, "message": "Untuk reset password, silakan hubungi bagian IT kampus atau kirim email ke support@lms.ac.id dengan menyertakan NIM dan email terdaftar Anda.", "time": "Baru saja"});
                      });
                    }),
                    _buildQuickReply("Akses Kelas", () {
                      setModalState(() {
                        chatMessages.add({"isBot": false, "message": "Akses Kelas", "time": "Baru saja"});
                        chatMessages.add({"isBot": true, "message": "Pastikan Anda sudah terdaftar di kelas tersebut. Jika belum muncul, hubungi dosen pengampu atau bagian akademik.", "time": "Baru saja"});
                      });
                    }),
                    _buildQuickReply("Error Aplikasi", () {
                      setModalState(() {
                        chatMessages.add({"isBot": false, "message": "Error Aplikasi", "time": "Baru saja"});
                        chatMessages.add({"isBot": true, "message": "Coba refresh halaman atau logout lalu login kembali. Jika masalah berlanjut, screenshot error dan kirim ke support@lms.ac.id", "time": "Baru saja"});
                      });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Input Field
              Container(
                padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: backgroundLight,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        ),
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            hintText: "Ketik pesan...",
                            hintStyle: TextStyle(color: textMuted, fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan.shade700]),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            setModalState(() {
                              chatMessages.add({"isBot": false, "message": messageController.text, "time": "Baru saja"});
                              chatMessages.add({"isBot": true, "message": "Terima kasih atas pertanyaan Anda! Tim support kami akan segera merespons. Untuk respon lebih cepat, silakan email ke support@lms.ac.id", "time": "Baru saja"});
                              messageController.clear();
                            });
                          }
                        },
                        icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(bool isBot, String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBot) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan.shade700]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.support_agent_rounded, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isBot ? backgroundLight : Colors.cyan,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isBot ? 4 : 16),
                  bottomRight: Radius.circular(isBot ? 16 : 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 13,
                      color: isBot ? textMain : Colors.white,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: isBot ? textMuted : Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isBot) const SizedBox(width: 42),
        ],
      ),
    );
  }

  Widget _buildQuickReply(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.cyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.cyan.withOpacity(0.3)),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.cyan, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem(Map<String, dynamic> faq, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: backgroundLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.cyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
          title: Text(
            faq["question"],
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textMain),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_rounded, color: Colors.cyan, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      faq["answer"],
                      style: TextStyle(fontSize: 12, color: textMuted, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
              GestureDetector(
                onTap: () => _showEditProfileDialog(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
                ),
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
