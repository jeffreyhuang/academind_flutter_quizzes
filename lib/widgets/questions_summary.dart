import 'package:flutter/material.dart';
import 'package:quizzes/widgets/questions_summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuestionsSummaryItem(
              questionIndex: data['question_index'] as int,
              question: data['question'] as String,
              userAnswer: data['user_answer'] as String,
              currectAnswer: data['correct_answer'] as String,
            );
          }).toList(),
        ),
      ),
    );
    // return const Text('summary');
  }
}
