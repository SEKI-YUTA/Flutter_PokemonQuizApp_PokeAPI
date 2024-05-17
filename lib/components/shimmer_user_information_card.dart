import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserInformationCard extends StatelessWidget {
  const ShimmerUserInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const AspectRatio(
        aspectRatio: 1.56,
        child: Card(),
      ),
    );
  }
}
