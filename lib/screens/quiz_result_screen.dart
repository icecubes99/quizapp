import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  String get resultMessage {
    double percentage = (score / totalQuestions) * 100;
    if (percentage >= 90) {
      return "Excellent! You're a Flutter expert! 🎉";
    } else if (percentage >= 70) {
      return "Great job! You know Flutter well! 👏";
    } else if (percentage >= 50) {
      return "Good effort! Keep learning Flutter! 📚";
    } else {
      return "Keep practicing! You'll get better! 💪";
    }
  }

  Color get resultColor {
    double percentage = (score / totalQuestions) * 100;
    if (percentage >= 70) {
      return Colors.green;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (score / totalQuestions) * 100;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Trophy/Result Icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      percentage >= 70 ? Icons.emoji_events : Icons.school,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Quiz Complete Text
                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Score Display
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$score / $totalQuestions',
                          style: TextStyle(
                            color: resultColor,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${percentage.toInt()}% Correct',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Result Message
                  Text(
                    resultMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 50),
                  
                  // Action Buttons
                  Column(
                    children: [
                      // Try Again Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.purple,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Try Again',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 15),
                      
                      // Back to Home Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
