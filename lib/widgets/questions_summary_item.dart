import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummaryItem extends StatelessWidget {
  const QuestionsSummaryItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.currectAnswer,
  });

  final int questionIndex;
  final String question;
  final String userAnswer;
  final String currectAnswer;

  @override
  Widget build(BuildContext context) {
    final Color questionNumberColor =
        userAnswer == currectAnswer ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: questionNumberColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 24),
            child: Text(
              (questionIndex + 1).toString(),
              textAlign: TextAlign.start,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  question,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  userAnswer,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                Text(
                  currectAnswer,
                  style: GoogleFonts.lato(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
