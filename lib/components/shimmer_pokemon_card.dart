import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPokemonCard extends StatelessWidget {
  const ShimmerPokemonCard(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
