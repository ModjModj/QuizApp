import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.questionsRight,
    required this.answeredQuestions,
  });

  final int questionsRight;
  final int answeredQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.blue,
          ),
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Center(
            child: Column(
              children: [
                Text('Current Score:', style: TextStyle(color: Colors.white)),
                Text(
                  '$questionsRight / $answeredQuestions',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
