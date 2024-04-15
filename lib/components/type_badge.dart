import 'package:flutter/material.dart';
import 'package:pokemon_quiz_app/util/ColorUtil.dart';

class TypeBadge extends StatelessWidget {
  Map<String, dynamic> data;
  TypeBadge({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Color(int.parse(data['data']['color'].toString(), radix: 16));
    return Container(
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(data['data']['typeJa'].toString(),
          style: TextStyle(
              color: backgroundColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white)),
    );
  }
}
