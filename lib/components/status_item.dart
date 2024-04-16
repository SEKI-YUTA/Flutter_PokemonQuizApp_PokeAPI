import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final int value;
  final statusMax = 255;
  final bool requireIndicator;
  final String? maskText;
  final BuildContext parentContext;
  const StatusItem(
      {super.key,
      required this.title,
      required this.value,
      this.requireIndicator = true,
      this.maskText,
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
          Text(maskText ?? value.toString()),
          const SizedBox(width: 8),
          requireIndicator
              ? Expanded(
                  child: LinearProgressIndicator(
                    value: maskText != null ? 0 : (value / statusMax),
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
