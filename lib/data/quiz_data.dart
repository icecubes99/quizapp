import '../models/quiz_question.dart';

class QuizData {
  static List<QuizQuestion> getFlutterQuestions() {
    return [
      QuizQuestion(
        question: "What is Flutter?",
        options: [
          "A programming language",
          "A mobile app development framework",
          "A database system",
          "An operating system"
        ],
        correctAnswerIndex: 1,
        explanation: "Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.",
      ),
      QuizQuestion(
        question: "Which programming language is primarily used in Flutter?",
        options: [
          "Java",
          "Swift",
          "Dart",
          "JavaScript"
        ],
        correctAnswerIndex: 2,
        explanation: "Flutter uses Dart, a programming language developed by Google, optimized for building user interfaces.",
      ),
      QuizQuestion(
        question: "What is a Widget in Flutter?",
        options: [
          "A small gadget",
          "The basic building block of Flutter UI",
          "A type of database",
          "A testing framework"
        ],
        correctAnswerIndex: 1,
        explanation: "In Flutter, everything is a widget. Widgets are the basic building blocks that describe what the UI should look like.",
      ),
      QuizQuestion(
        question: "Which widget is used for creating a scrollable list in Flutter?",
        options: [
          "Container",
          "Column",
          "ListView",
          "Stack"
        ],
        correctAnswerIndex: 2,
        explanation: "ListView is a scrollable widget that displays its children in a linear array and can scroll when there are more children than the screen can fit.",
      ),
      QuizQuestion(
        question: "What does 'Hot Reload' mean in Flutter?",
        options: [
          "Restarting the entire app",
          "Quickly seeing changes without losing app state",
          "Loading data from internet",
          "Debugging errors"
        ],
        correctAnswerIndex: 1,
        explanation: "Hot Reload allows developers to see changes almost instantly without losing the current application state, making development faster and more efficient.",
      ),
      QuizQuestion(
        question: "Which Flutter widget is used for handling user input?",
        options: [
          "Text",
          "Image",
          "TextField",
          "Container"
        ],
        correctAnswerIndex: 2,
        explanation: "TextField is the primary widget used for accepting user text input in Flutter applications.",
      ),
      QuizQuestion(
        question: "What is the difference between StatelessWidget and StatefulWidget?",
        options: [
          "No difference",
          "StatelessWidget can change, StatefulWidget cannot",
          "StatefulWidget can change its state, StatelessWidget cannot",
          "They are used for different platforms"
        ],
        correctAnswerIndex: 2,
        explanation: "StatefulWidget can change its internal state and rebuild the UI accordingly, while StatelessWidget remains immutable once built.",
      ),
      QuizQuestion(
        question: "Which method is called when a StatefulWidget is first created?",
        options: [
          "build()",
          "initState()",
          "dispose()",
          "setState()"
        ],
        correctAnswerIndex: 1,
        explanation: "initState() is called once when the StatefulWidget is first created and inserted into the widget tree.",
      ),
      QuizQuestion(
        question: "What is the purpose of pubspec.yaml file in Flutter?",
        options: [
          "To write Dart code",
          "To manage project dependencies and assets",
          "To create UI layouts",
          "To handle app navigation"
        ],
        correctAnswerIndex: 1,
        explanation: "pubspec.yaml is the project configuration file that manages dependencies, assets, and other project metadata.",
      ),
      QuizQuestion(
        question: "Which command is used to create a new Flutter project?",
        options: [
          "flutter new project_name",
          "flutter create project_name",
          "flutter init project_name",
          "flutter start project_name"
        ],
        correctAnswerIndex: 1,
        explanation: "The 'flutter create project_name' command creates a new Flutter project with the specified name.",
      ),
    ];
  }
}
