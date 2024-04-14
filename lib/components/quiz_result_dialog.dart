import 'package:flutter/material.dart';

class QuizResultDialog extends StatelessWidget {
  final bool isCorrect;
  final Function() onNextClick;
  const QuizResultDialog(
      {super.key, required this.isCorrect, required this.onNextClick});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("クイズの結果"),
            Text(isCorrect ? "正解" : "不正解"),
            ElevatedButton(onPressed: onNextClick, child: const Text("次の問題へ"))
          ],
        ),
      ),
    );
  }
}
