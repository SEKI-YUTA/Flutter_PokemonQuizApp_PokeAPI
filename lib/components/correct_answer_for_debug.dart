import 'package:flutter/material.dart';

class CorrectAnswerForDevug extends StatelessWidget {
  final String text;
  const CorrectAnswerForDevug({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Center(
        child: Column(
          children: [
            const Text("デバッグ用のUIです。"),
            Text(text, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}