import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.onStart,
  });

  final void Function() onStart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 220,
            color: const Color.fromARGB(230, 255, 255, 255),
          ),
          const SizedBox(height: 45),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: onStart,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 25, 103, 210),
              padding: const EdgeInsets.only(left: 15, right: 20),
            ),
            icon: const Icon(Icons.rocket_launch),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
