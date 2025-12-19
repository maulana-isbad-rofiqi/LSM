import 'package:flutter/material.dart';

// Color Constants
const Color primaryRed = Color(0xFFB91C1C);
const Color secondaryRed = Color(0xFF991B1B);
const Color accentRed = Color(0xFFDC2626);
const Color darkRed = Color(0xFF7F1D1D);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);
const Color backgroundLight = Color(0xFFF9FAFB);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  _buildMenuSection("Akun", [
                    _MenuItem(Icons.person_rounded, "Edit Profil", Colors.blue),
                    _MenuItem(Icons.lock_rounded, "Ubah Password", Colors.orange),
                    _MenuItem(Icons.notifications_rounded, "Notifikasi", Colors.purple),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection("Akademik", [
                    _MenuItem(Icons.school_rounded, "Riwayat Akademik", Colors.green),
                    _MenuItem(Icons.calendar_month_rounded, "Jadwal Kuliah", Colors.teal),
                    _MenuItem(Icons.assignment_rounded, "Transkrip Nilai", Colors.indigo),
                  ]),
                  const SizedBox(height: 20),
                  _buildMenuSection("Lainnya", [
                    _MenuItem(Icons.help_rounded, "Bantuan", Colors.cyan),
                    _MenuItem(Icons.info_rounded, "Tentang Aplikasi", Colors.grey),
                    _MenuItem(Icons.logout_rounded, "Keluar", Colors.red),
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

  Widget _buildMenuSection(String title, List<_MenuItem> items) {
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
                    onTap: () {},
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

  _MenuItem(this.icon, this.title, this.color);
}
