import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final int value;
  final statusMax = 255;
  const StatusItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 16),
        Text(value.toString()),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: value / statusMax,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ],
    );
  }
}
