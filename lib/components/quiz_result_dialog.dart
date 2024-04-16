import 'package:flutter/material.dart';

class QuizResultDialog extends StatelessWidget {
  final bool isCorrect;
  final String pokemonName;
  final String pokemonImageUrl;
  final Function() onNextClick;
  const QuizResultDialog(
      {super.key,
      required this.isCorrect,
      required this.pokemonName,
      required this.pokemonImageUrl,
      required this.onNextClick});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "クイズの結果",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              isCorrect ? "正解!!🎉" : "不正解😭",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Image.network(width: 200, height: 200, pokemonImageUrl),
            Text("$pokemonNameを捕まえたよ!!",
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onNextClick, child: const Text("次の問題へ"))
          ],
        ),
      ),
    );
  }
}
