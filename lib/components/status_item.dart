import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final int value;
  final statusMax = 255;
  final bool requireIndicator;
  final BuildContext parentContext;
  const StatusItem(
      {super.key,
      required this.title,
      required this.value,
      this.requireIndicator = true,
      required this.parentContext});

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(parentContext).textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: myStyle,
          ),
          const SizedBox(width: 16),
          Text(value.toString()),
          const SizedBox(width: 8),
          requireIndicator
              ? Expanded(
                  child: LinearProgressIndicator(
                    value: value / statusMax,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
