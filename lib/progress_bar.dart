import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.questions,
    required this.answered,
  });

  final int questions;
  final int answered;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (answered / questions),
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
