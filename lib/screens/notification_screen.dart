import 'package:flutter/material.dart';

// Color Constants
const Color primaryRed = Color(0xFFB91C1C);
const Color secondaryRed = Color(0xFF991B1B);
const Color accentRed = Color(0xFFDC2626);
const Color darkRed = Color(0xFF7F1D1D);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);
const Color backgroundLight = Color(0xFFF9FAFB);

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ["Semua", "Tugas", "Pengumuman", "Nilai"];

  final List<Map<String, dynamic>> _notifications = [
    {
      "type": "tugas",
      "title": "Tugas Baru: UI/UX Design",
      "message": "Tugas 07 - UD Android Mobile Game telah ditambahkan. Deadline: 28 Februari 2025",
      "time": "5 menit lalu",
      "isRead": false,
      "icon": Icons.assignment_rounded,
      "color": Colors.orange,
    },
    {
      "type": "pengumuman",
      "title": "Maintenance Sistem",
      "message": "Sistem akan mengalami maintenance pada tanggal 25 Desember 2024 pukul 00:00 - 06:00 WIB",
      "time": "1 jam lalu",
      "isRead": false,
      "icon": Icons.campaign_rounded,
      "color": Colors.blue,
    },
    {
      "type": "nilai",
      "title": "Nilai Quiz Telah Keluar",
      "message": "Nilai Quiz Pemahaman Dasar UI/UX telah dipublikasikan. Lihat hasilnya sekarang!",
      "time": "2 jam lalu",
      "isRead": true,
      "icon": Icons.grade_rounded,
      "color": Colors.green,
    },
    {
      "type": "tugas",
      "title": "Reminder: Deadline Tugas",
      "message": "Tugas Wireframing akan berakhir dalam 2 hari. Segera kumpulkan!",
      "time": "3 jam lalu",
      "isRead": true,
      "icon": Icons.alarm_rounded,
      "color": Colors.red,
    },
    {
      "type": "pengumuman",
      "title": "Jadwal UAS Semester Genap",
      "message": "Jadwal Ujian Akhir Semester Genap 2023/2024 telah dirilis. Cek jadwal Anda sekarang.",
      "time": "1 hari lalu",
      "isRead": true,
      "icon": Icons.event_rounded,
      "color": Colors.purple,
    },
    {
      "type": "nilai",
      "title": "Nilai Tugas Diperbaharui",
      "message": "Nilai tugas Sistem Operasi telah diperbaharui oleh dosen.",
      "time": "2 hari lalu",
      "isRead": true,
      "icon": Icons.update_rounded,
      "color": Colors.teal,
    },
    {
      "type": "pengumuman",
      "title": "Selamat Datang!",
      "message": "Selamat bergabung di LMS Universitas. Mulai perjalanan belajar Anda sekarang!",
      "time": "1 minggu lalu",
      "isRead": true,
      "icon": Icons.celebration_rounded,
      "color": Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Premium Header
          SliverToBoxAdapter(child: _buildPremiumHeader()),
          
          // Filter Chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: _buildFilterChips(),
            ),
          ),
          
          // Stats Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: _buildStatsRow(),
            ),
          ),
          
          // Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "🔔 Notifikasi Terbaru",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: textMain),
                  ),
                  GestureDetector(
                    onTap: _markAllAsRead,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: primaryRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Tandai Semua Dibaca",
                        style: TextStyle(color: primaryRed, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Notifications List
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            sliver: _buildNotificationsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumHeader() {
    final unreadCount = _notifications.where((n) => n["isRead"] == false).length;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 24),
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
            children: [
              const Expanded(
                child: Text(
                  "Notifikasi",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () => _showNotificationSettingsDialog(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.settings_rounded, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.notifications_active_rounded, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notifikasi Belum Dibaca",
                        style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$unreadCount Notifikasi Baru",
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                if (unreadCount > 0)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "$unreadCount",
                        style: TextStyle(color: primaryRed, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilter == index;
          return Padding(
            padding: EdgeInsets.only(right: index < _filters.length - 1 ? 10 : 0),
            child: GestureDetector(
              onTap: () => setState(() => _selectedFilter = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected ? LinearGradient(colors: [primaryRed, secondaryRed]) : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected ? primaryRed.withOpacity(0.3) : Colors.black.withOpacity(0.05),
                      blurRadius: isSelected ? 12 : 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : textMuted,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard("2", "Belum\nDibaca", Icons.mark_email_unread_rounded, Colors.orange)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard("5", "Sudah\nDibaca", Icons.mark_email_read_rounded, Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard("7", "Total\nNotifikasi", Icons.notifications_rounded, Colors.blue)),
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
          Text(value, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: textMuted, fontSize: 10, height: 1.3), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    final filteredNotifications = _selectedFilter == 0
        ? _notifications
        : _notifications.where((n) => n["type"] == _filters[_selectedFilter].toLowerCase()).toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = filteredNotifications[index];
          final isRead = item["isRead"] as bool;
          final color = item["color"] as Color;

          return Padding(
            padding: EdgeInsets.only(bottom: index < filteredNotifications.length - 1 ? 12 : 0),
            child: Dismissible(
              key: Key(item["title"]),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.delete_rounded, color: Colors.white),
              ),
              child: GestureDetector(
                onTap: () => _markAsRead(index),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: !isRead ? Border.all(color: color.withOpacity(0.4), width: 1.5) : null,
                    boxShadow: [
                      BoxShadow(
                        color: (!isRead ? color : Colors.black).withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Stack(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [color.withOpacity(0.2), color.withOpacity(0.1)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Icon(item["icon"] as IconData, color: color, size: 26),
                            ),
                          ),
                          if (!isRead)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 14),
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    (item["type"] as String).toUpperCase(),
                                    style: TextStyle(fontSize: 9, color: color, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  item["time"] as String,
                                  style: TextStyle(fontSize: 10, color: textMuted),
                                ),
                                const Spacer(),
                                if (!isRead)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: primaryRed,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      "BARU",
                                      style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item["title"] as String,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isRead ? FontWeight.w500 : FontWeight.bold,
                                color: isRead ? textMuted : textMain,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["message"] as String,
                              style: TextStyle(fontSize: 12, color: textMuted, height: 1.4),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: filteredNotifications.length,
      ),
    );
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]["isRead"] = true;
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification["isRead"] = true;
      }
    });
  }

  void _showNotificationSettingsDialog(BuildContext context) {
    bool tugasNotif = true;
    bool pengumumanNotif = true;
    bool nilaiNotif = true;
    bool reminderNotif = true;
    bool soundNotif = true;
    bool vibrationNotif = true;
    bool emailNotif = false;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.8,
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
                        color: primaryRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.settings_rounded, color: primaryRed, size: 24),
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
                      // Push Notification Section
                      Row(
                        children: [
                          Icon(Icons.notifications_active_rounded, color: primaryRed, size: 20),
                          const SizedBox(width: 8),
                          const Text("Push Notification", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain)),
                        ],
                      ),
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
                        "Pengingat sebelum deadline tugas",
                        Icons.alarm_rounded,
                        Colors.red,
                        reminderNotif,
                        (val) => setModalState(() => reminderNotif = val),
                      ),
                      const SizedBox(height: 24),
                      // Sound & Vibration Section
                      Row(
                        children: [
                          Icon(Icons.volume_up_rounded, color: primaryRed, size: 20),
                          const SizedBox(width: 8),
                          const Text("Suara & Getaran", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildNotifToggle(
                        "Suara Notifikasi",
                        "Putar suara saat menerima notifikasi",
                        Icons.notifications_rounded,
                        Colors.purple,
                        soundNotif,
                        (val) => setModalState(() => soundNotif = val),
                      ),
                      const SizedBox(height: 12),
                      _buildNotifToggle(
                        "Getaran",
                        "Getar saat menerima notifikasi",
                        Icons.vibration_rounded,
                        Colors.indigo,
                        vibrationNotif,
                        (val) => setModalState(() => vibrationNotif = val),
                      ),
                      const SizedBox(height: 24),
                      // Email Section
                      Row(
                        children: [
                          Icon(Icons.email_rounded, color: primaryRed, size: 20),
                          const SizedBox(width: 8),
                          const Text("Notifikasi Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textMain)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildNotifToggle(
                        "Email Notification",
                        "Kirim notifikasi penting via email",
                        Icons.mark_email_unread_rounded,
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
                          backgroundColor: primaryRed,
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
}
