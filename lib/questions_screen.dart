import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // to center the content vertically
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width * 0.9,
    //     height: MediaQuery.of(context).size.height * 0.9,
    //     margin: const EdgeInsets.all(40),
    //     child: Wrap(
    //       // direction: Axis.vertical,
    //       runAlignment: WrapAlignment.center, // Centers the content vertically
    //       alignment:
    //           WrapAlignment.center, // Centers the button content horizontally

    //       // crossAxisAlignment: WrapCrossAlignment.center,
    //       spacing: 20, // side spacing between buttons
    //       runSpacing: 20, // spacing between lines of buttons
    //       // mainAxisAlignment: MainAxisAlignment.center,      // to center the content vertically
    //       // crossAxisAlignment: CrossAxisAlignment.stretch,   // to make buttons full width
    //       children: <Widget>[
    //         Text(
    //           textAlign: TextAlign.center,
    //           currentQuestion.text,
    //           style: GoogleFonts.lato(
    //             color: const Color.fromARGB(255, 201, 153, 251),
    //             fontSize: 24,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         const SizedBox(height: 30),
    //         ...currentQuestion.shuffledAnswers.map((answer) {
    //           return AnswerButton(
    //             answerText: answer,
    //             onTap: () {
    //               answerQuestion(answer);
    //             },
    //           );
    //         }),
    //       ],
    //     ),
    //   ),
    // );
  }
}
