import 'package:flutter/material.dart';

/// Slight gradient that is stacked on top of the feature badge
class StackedGradient extends StatelessWidget {
  /// Color of the gradient
  final Color color;

  /// Slight gradient that is stacked on top of the feature badge
  const StackedGradient({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20,
      left: -60,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withOpacity(0.1),
              color.withOpacity(0.08),
              color.withOpacity(0.06),
              color.withOpacity(0.04),
              color.withOpacity(0.02),
              Colors.transparent
            ],
          ),
        ),
      ),
    );
  }
}
