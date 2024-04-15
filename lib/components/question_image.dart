import 'package:flutter/material.dart';

class QuestionImage extends StatelessWidget {
  const QuestionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Image.asset("assets/images/question_white.png")
        : Image.asset("assets/images/question_black.png");
  }
}
