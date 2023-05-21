import 'package:flutter/material.dart';
import 'package:quizzes/data/questions.dart';
import 'package:quizzes/widgets/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestionsCount = questions.length;
    final correctQuestionsCount = summaryData
        .where((el) => el['correct_answer'] == el['user_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctQuestionsCount out of $totalQuestionsCount questions correctly!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 25, 103, 210),
              padding: const EdgeInsets.only(left: 15, right: 20),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
