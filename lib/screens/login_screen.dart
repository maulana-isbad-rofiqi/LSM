import 'package:flutter/material.dart';
import 'home_screen.dart';

const Color primaryRed = Color(0xFFB91C1C);
const Color secondaryRed = Color(0xFF991B1B);
const Color backgroundLight = Color(0xFFFFFFFF);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // ================= BOTTOM WAVE =================
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 120,
              child: CustomPaint(
                painter: BottomWavePainter(),
              ),
            ),

            // ================= SCROLLABLE CONTENT =================
            SingleChildScrollView(
              child: Column(
                children: [
                  // ================= HEADER =================
                  // ================= HEADER =================
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Background Image Container
                      Container(
                        height: 280, // Matches the stack height logically now
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(40),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg_login.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black26,
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black12,
                                Colors.transparent,
                                Colors.black12,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // ================= LOGO (ASSET) =================
                      Positioned(
                        top: 232, // Centered on the curve (280 - 48)
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 96,
                            height: 96,
                            padding: const EdgeInsets.all(4), // Thinner border
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: primaryRed.withOpacity(0.25),
                                  blurRadius: 25,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white, // Clean white background for logo
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  width: 56, // Slightly larger logo
                                  height: 56,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Space for the protruding logo (48px) + extra padding
                  const SizedBox(height: 60),

                  // ================= FORM =================
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // EMAIL
                        _buildMaterialInput(
                          label: "Email",
                        ),

                        const SizedBox(height: 32),

                        // PASSWORD
                        _buildMaterialInput(
                          label: "Password",
                          isPassword: true,
                          obscure: obscure,
                          onToggleVisibility: () =>
                              setState(() => obscure = !obscure),
                        ),

                        const SizedBox(height: 48),

                        // LOGIN BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryRed,
                              foregroundColor: Colors.white,
                              elevation: 8,
                              shadowColor: primaryRed.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ).copyWith(
                              overlayColor:
                                  MaterialStateProperty.resolveWith(
                                (states) =>
                                    secondaryRed.withOpacity(0.1),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // HELP
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Bantuan",
                                  style: TextStyle(
                                    color: textMuted,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "?",
                                      style: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialInput({
    required String label,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? onToggleVisibility,
  }) {
    return TextFormField(
      style: const TextStyle(fontSize: 16, color: textMain),
      obscureText: isPassword ? obscure : false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: textMuted),
        floatingLabelStyle: const TextStyle(color: primaryRed),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD1D5DB), width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: primaryRed, width: 2),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey[400],
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}

class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / 1440;
    final double scaleY = size.height / 320;

    Path path = Path()
      ..moveTo(0, 224 * scaleY)
      ..lineTo(48 * scaleX, 213.3 * scaleY)
      ..cubicTo(
        96 * scaleX,
        203 * scaleY,
        192 * scaleX,
        181 * scaleY,
        288 * scaleX,
        181.3 * scaleY,
      )
      ..cubicTo(
        384 * scaleX,
        181 * scaleY,
        480 * scaleX,
        203 * scaleY,
        576 * scaleX,
        213.3 * scaleY,
      )
      ..cubicTo(
        672 * scaleX,
        224 * scaleY,
        768 * scaleX,
        224 * scaleY,
        864 * scaleX,
        202.7 * scaleY,
      )
      ..cubicTo(
        960 * scaleX,
        181 * scaleY,
        1056 * scaleX,
        139 * scaleY,
        1152 * scaleX,
        133.3 * scaleY,
      )
      ..cubicTo(
        1248 * scaleX,
        128 * scaleY,
        1344 * scaleX,
        160 * scaleY,
        1392 * scaleX,
        176 * scaleY,
      )
      ..lineTo(1440 * scaleX, 192 * scaleY)
      ..lineTo(1440 * scaleX, 320 * scaleY)
      ..lineTo(0, 320 * scaleY)
      ..close();

    Paint paint = Paint()..color = primaryRed;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
