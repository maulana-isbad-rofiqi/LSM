import 'package:flutter/material.dart';

// Color Constants
const Color primaryRed = Color(0xFFB91C1C);
const Color secondaryRed = Color(0xFF991B1B);
const Color accentRed = Color(0xFFDC2626);
const Color darkRed = Color(0xFF7F1D1D);
const Color textMain = Color(0xFF1F2937);
const Color textMuted = Color(0xFF6B7280);
const Color backgroundLight = Color(0xFFF9FAFB);

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;
  bool _quizCompleted = false;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Apa kepanjangan dari UI dalam konteks desain?",
      "options": ["User Interface", "User Interaction", "Universal Interface", "Unified Integration"],
      "correct": 0,
    },
    {
      "question": "UX adalah singkatan dari?",
      "options": ["User Example", "User Experience", "Universal Experience", "Unified Experience"],
      "correct": 1,
    },
    {
      "question": "Prinsip dasar desain yang baik meliputi...",
      "options": ["Kompleksitas tinggi", "Konsistensi dan kesederhanaan", "Warna mencolok", "Banyak animasi"],
      "correct": 1,
    },
    {
      "question": "Wireframe digunakan untuk?",
      "options": ["Membuat animasi", "Merencanakan struktur layout", "Membuat database", "Testing aplikasi"],
      "correct": 1,
    },
    {
      "question": "Apa tujuan utama dari prototype?",
      "options": ["Menguji ide sebelum development", "Membuat dokumentasi", "Menghitung budget", "Merekrut tim"],
      "correct": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      body: _quizCompleted ? _buildResultScreen() : _buildQuizScreen(),
    );
  }

  Widget _buildQuizScreen() {
    final question = _questions[_currentQuestion];
    final progress = (_currentQuestion + 1) / _questions.length;

    return SafeArea(
      child: Column(
        children: [
          // Header
          _buildHeader(progress),
          
          // Question Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Pertanyaan ${_currentQuestion + 1} dari ${_questions.length}",
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          question["question"] as String,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Options
                  ...List.generate(
                    (question["options"] as List).length,
                    (index) => _buildOptionCard(index, question),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Button
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildHeader(double progress) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => _showExitDialog(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.close_rounded, color: primaryRed, size: 20),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Quiz: Pemahaman Dasar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textMain)),
                    Text("UI/UX Design", style: TextStyle(fontSize: 12, color: textMuted)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer_rounded, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text("10:00", style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress Bar
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(color: primaryRed.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [accentRed, primaryRed]),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: primaryRed.withOpacity(0.4), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(int index, Map<String, dynamic> question) {
    final isSelected = _selectedAnswer == index;
    final isCorrect = question["correct"] == index;
    
    Color borderColor = Colors.transparent;
    Color bgColor = Colors.white;
    
    if (_answered) {
      if (isCorrect) {
        borderColor = Colors.green;
        bgColor = Colors.green.withOpacity(0.1);
      } else if (isSelected && !isCorrect) {
        borderColor = Colors.red;
        bgColor = Colors.red.withOpacity(0.1);
      }
    } else if (isSelected) {
      borderColor = primaryRed;
      bgColor = primaryRed.withOpacity(0.05);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: _answered ? null : () => setState(() => _selectedAnswer = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected ? primaryRed : primaryRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      color: isSelected ? Colors.white : primaryRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  (question["options"] as List)[index] as String,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textMain),
                ),
              ),
              if (_answered)
                Icon(
                  isCorrect ? Icons.check_circle_rounded : (isSelected ? Icons.cancel_rounded : null),
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).padding.bottom + 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: primaryRed.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: _selectedAnswer == null ? null : () => _handleAnswer(),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryRed,
            disabledBackgroundColor: primaryRed.withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
          child: Text(
            _answered ? (_currentQuestion < _questions.length - 1 ? "Lanjut" : "Lihat Hasil") : "Jawab",
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    final percentage = (_score / _questions.length * 100).round();
    final isPassed = percentage >= 70;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: isPassed ? [Colors.green, Colors.green.shade700] : [Colors.orange, Colors.orange.shade700]),
                  boxShadow: [
                    BoxShadow(color: (isPassed ? Colors.green : Colors.orange).withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
                  ],
                ),
                child: Center(
                  child: Icon(isPassed ? Icons.check_rounded : Icons.refresh_rounded, color: Colors.white, size: 60),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                isPassed ? "Selamat! 🎉" : "Coba Lagi! 💪",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textMain),
              ),
              const SizedBox(height: 8),
              Text(
                isPassed ? "Anda lulus quiz ini" : "Anda perlu belajar lebih banyak",
                style: TextStyle(fontSize: 14, color: textMuted),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    Text("Skor Anda", style: TextStyle(fontSize: 14, color: textMuted)),
                    const SizedBox(height: 8),
                    Text("$percentage%", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: isPassed ? Colors.green : Colors.orange)),
                    const SizedBox(height: 8),
                    Text("$_score dari ${_questions.length} benar", style: TextStyle(fontSize: 14, color: textMuted)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: primaryRed, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text("Kembali", style: TextStyle(color: primaryRed, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: primaryRed,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text("Ulangi Quiz", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAnswer() {
    if (!_answered) {
      setState(() {
        _answered = true;
        if (_selectedAnswer == _questions[_currentQuestion]["correct"]) {
          _score++;
        }
      });
    } else {
      if (_currentQuestion < _questions.length - 1) {
        setState(() {
          _currentQuestion++;
          _selectedAnswer = null;
          _answered = false;
        });
      } else {
        setState(() => _quizCompleted = true);
      }
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _selectedAnswer = null;
      _answered = false;
      _quizCompleted = false;
    });
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Keluar Quiz?"),
        content: const Text("Progress Anda akan hilang jika keluar sekarang."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: primaryRed),
            child: const Text("Keluar", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
