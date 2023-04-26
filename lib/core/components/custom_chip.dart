import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// Custom chip widget - it can act like a
/// button or just a static info display widget
class CustomChip extends StatelessWidget {
  /// child widget
  final Widget child;

  /// on Tap function
  final void Function()? onTap;

  /// if this chip is selected
  final bool isSelected;

  /// Custom chip widget - it can act like a
  /// button or just a static info display widget
  const CustomChip({
    super.key,
    required this.child,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: colors.components.blocks.background,
        border: Border.all(
          color: isSelected
              ? colors.accents.blue
              : colors.components.blocks.border,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
