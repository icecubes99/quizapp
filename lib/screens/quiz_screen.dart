import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../data/quiz_data.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  late List<QuizQuestion> questions;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0;
  bool isAnswered = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    questions = QuizData.getFlutterQuestions();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectAnswer(int answerIndex) {
    if (isAnswered) return;
    
    setState(() {
      selectedAnswerIndex = answerIndex;
      isAnswered = true;
      
      if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });

    // Auto advance to next question after a delay
    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        isAnswered = false;
      });
      _animationController.reset();
      _animationController.forward();
    } else {
      // Quiz completed, go to results
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  Color getOptionColor(int index) {
    if (!isAnswered) {
      return Colors.white.withOpacity(0.1);
    }
    
    if (index == questions[currentQuestionIndex].correctAnswerIndex) {
      return Colors.green.withOpacity(0.8);
    } else if (index == selectedAnswerIndex && selectedAnswerIndex != questions[currentQuestionIndex].correctAnswerIndex) {
      return Colors.red.withOpacity(0.8);
    }
    return Colors.white.withOpacity(0.1);
  }

  IconData getOptionIcon(int index) {
    if (!isAnswered) return Icons.radio_button_unchecked;
    
    if (index == questions[currentQuestionIndex].correctAnswerIndex) {
      return Icons.check_circle;
    } else if (index == selectedAnswerIndex && selectedAnswerIndex != questions[currentQuestionIndex].correctAnswerIndex) {
      return Icons.cancel;
    }
    return Icons.radio_button_unchecked;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Question ${currentQuestionIndex + 1}/${questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Score: $score',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Progress bar
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                
                const SizedBox(height: 40),
                
                // Question
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Text(
                      currentQuestion.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Answer options
                Expanded(
                  child: ListView.builder(
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () => selectAnswer(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: getOptionColor(index),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  getOptionIcon(index),
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    currentQuestion.options[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Show explanation if answered
                if (isAnswered) ...[
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Explanation:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currentQuestion.explanation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
