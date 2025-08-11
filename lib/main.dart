import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizMainScreen(),
    );
  }
}

class QuizMainScreen extends StatelessWidget {
  const QuizMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              
              // Quiz Logo
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/quiz-logo.png',
                  height: 350,
                  width: 350,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image doesn't load
                    return Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.quiz,
                        size: 150,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Welcome Text
              Text(
                'Learn Flutter the fun way!',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40),
              
              // Start Quiz Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Start Quiz',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

