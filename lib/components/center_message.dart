import 'package:flutter/material.dart';

class CenterMessage extends StatelessWidget {
  String message;
  bool showingLoadingIndicatoro;
  CenterMessage(
      {super.key,
      required this.message,
      this.showingLoadingIndicatoro = false});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        const SizedBox(height: 16),
        if (showingLoadingIndicatoro) const CircularProgressIndicator()
      ],
    ));
  }
}
