import 'package:flutter/material.dart';

class CenterMessage extends StatelessWidget {
  final String message;
  final bool showingLoadingIndicatoro;
  const CenterMessage(
      {super.key,
      required this.message,
      this.showingLoadingIndicatoro = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (showingLoadingIndicatoro) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
