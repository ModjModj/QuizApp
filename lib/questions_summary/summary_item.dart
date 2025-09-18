import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                itemData['question'] as String,
              ),
              SizedBox(height: 5),
              Text(
                style: const TextStyle(
                  color: Color.fromARGB(255, 202, 171, 252),
                ),
                itemData['user_answer'] as String,
              ),
              Text(
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                ),
                itemData['correct_answer'] as String,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
