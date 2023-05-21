import 'package:flutter/material.dart';
import 'package:quizzes/layout_base.dart';
import 'package:quizzes/screens/questions_screen.dart';
import 'package:quizzes/screens/results_screen.dart';
import 'package:quizzes/screens/start_screen.dart';
import 'package:quizzes/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void collectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      onStart: startQuiz,
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onAnswerSelected: collectAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutBase(
        child: screenWidget,
      ),
    );
  }
}
