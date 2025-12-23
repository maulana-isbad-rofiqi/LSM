import 'package:flutter/material.dart';
import 'home_screen.dart';

const Color primaryRed = Color(0xFFDC2626);
const Color secondaryRed = Color(0xFFB91C1C);
const Color darkRed = Color(0xFF991B1B);
const Color backgroundLight = Color(0xFFFFFFFF);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _npmController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _npmController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      if (_isLogin) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
          _isLogin = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text("Akun berhasil dibuat!", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER DENGAN BACKGROUND IMAGE =================
            SizedBox(
              height: screenHeight * 0.40,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Image with Curved Bottom
                  Positioned.fill(
                    child: ClipPath(
                      clipper: CurvedBottomClipper(),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg_login.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.1),
                                primaryRed.withOpacity(0.15),
                                Colors.black.withOpacity(0.25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Decorative Circles
                  Positioned(
                    top: -30,
                    right: -30,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: -20,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.06),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    right: 30,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                  ),
                  
                  // Logo Circle with Glow
                  Positioned(
                    bottom: -48,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primaryRed, darkRed],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryRed.withOpacity(0.5),
                              blurRadius: 25,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 52,
                              height: 52,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Space for overlapping logo
            const SizedBox(height: 58),
            
            // ================= FORM SECTION =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab Switcher
                  Container(
                    height: 48,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _buildTab("Masuk", Icons.login_rounded, _isLogin, () => setState(() => _isLogin = true)),
                        _buildTab("Daftar", Icons.person_add_rounded, !_isLogin, () => setState(() => _isLogin = false)),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 28),
                  
                  // Form Title
                  Text(
                    _isLogin ? "Login" : "Daftar Akun",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textMain),
                  ),
                  const SizedBox(height: 24),
                  
                  // Form Fields
                  if (_isLogin) ...[
                    // LOGIN FORM
                    _buildTextField(
                      controller: _emailController,
                      label: "Email / NPM",
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _passwordController,
                      label: "Password",
                      isPassword: true,
                      obscure: _obscurePassword,
                      onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => _showForgotPasswordDialog(context),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: const Text("Lupa Password?", style: TextStyle(color: primaryRed, fontSize: 13)),
                      ),
                    ),
                  ] else ...[
                    // REGISTER FORM
                    _buildTextField(controller: _nameController, label: "Nama Lengkap"),
                    const SizedBox(height: 16),
                    _buildTextField(controller: _npmController, label: "NPM"),
                    const SizedBox(height: 16),
                    _buildTextField(controller: _emailController, label: "Email"),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _passwordController,
                      label: "Password",
                      isPassword: true,
                      obscure: _obscurePassword,
                      onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _confirmController,
                      label: "Konfirmasi Password",
                      isPassword: true,
                      obscure: _obscureConfirm,
                      onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ],
                  
                  const SizedBox(height: 28),
                  
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryRed,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                            )
                          : Text(
                              _isLogin ? "Masuk" : "Buat Akun",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Help Link
                  Center(
                    child: TextButton(
                      onPressed: () => _showHelpDialog(context),
                      child: const Text(
                        "Bantuan ?",
                        style: TextStyle(color: primaryRed, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // ================= BOTTOM WAVE =================
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CustomPaint(painter: WavePainter()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, IconData icon, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive ? [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
            ] : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: isActive ? primaryRed : textMuted),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isActive ? primaryRed : textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? onToggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? obscure : false,
      style: const TextStyle(fontSize: 15, color: textMain),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: textMuted, fontSize: 14),
        floatingLabelStyle: const TextStyle(color: primaryRed),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: primaryRed, width: 2),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onToggle,
                icon: Icon(
                  obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: textMuted,
                  size: 22,
                ),
              )
            : null,
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: primaryRed.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.help_rounded, color: primaryRed, size: 22),
                  ),
                  const SizedBox(width: 12),
                  const Text("Bantuan Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                  const Spacer(),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: textMuted)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildHelpItem("Cara Login", "Masukkan Email atau NPM dan password Anda."),
                  _buildHelpItem("Cara Daftar", "Klik tab 'Daftar', isi nama, NPM, email, dan password."),
                  _buildHelpItem("Lupa Password", "Hubungi admin kampus untuk reset password."),
                  _buildHelpItem("Kontak", "Email: support@lms.ac.id"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: primaryRed.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.lock_reset_rounded, color: primaryRed, size: 22),
                  ),
                  const SizedBox(width: 12),
                  const Text("Reset Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textMain)),
                  const Spacer(),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close, color: textMuted)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryRed.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: primaryRed.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline_rounded, color: primaryRed, size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Untuk mereset password, silakan hubungi admin kampus atau IT Support.",
                              style: TextStyle(fontSize: 13, color: textMain, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildContactItem(Icons.email_rounded, "Email", "support@lms.ac.id", Colors.blue),
                    const SizedBox(height: 12),
                    _buildContactItem(Icons.phone_rounded, "Telepon", "(021) 123-4567", Colors.green),
                    const SizedBox(height: 12),
                    _buildContactItem(Icons.location_on_rounded, "Lokasi", "Gedung IT, Lantai 2", Colors.orange),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 11, color: textMuted)),
              Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textMain)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: textMain)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 13, color: textMuted)),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = primaryRed;
    
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25, size.width * 0.5, size.height * 0.45);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.65, size.width, size.height * 0.35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    canvas.drawPath(path, paint);
    
    // Second wave
    final paint2 = Paint()..color = secondaryRed.withOpacity(0.7);
    final path2 = Path();
    path2.moveTo(0, size.height * 0.75);
    path2.quadraticBezierTo(size.width * 0.35, size.height * 0.45, size.width * 0.6, size.height * 0.65);
    path2.quadraticBezierTo(size.width * 0.85, size.height * 0.8, size.width, size.height * 0.55);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
