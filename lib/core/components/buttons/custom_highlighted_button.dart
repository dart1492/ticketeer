import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// This button is in accent.blue colors -
/// it is highlighted by the accent color
/// to stand out on the screen
class CustomHighlightedButton extends StatelessWidget {
  /// This button is in accent.blue colors -
  /// it is highlighted by the accent color
  /// to stand out on the screen
  const CustomHighlightedButton({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  });

  /// Child that will be displayed in the center of this button
  final Widget child;

  /// Padding, applied to the child
  final EdgeInsets? padding;

  /// Width of the button. If null - double.infinity
  final double? width;

  /// height of the button. if null - zero
  final double? height;

  /// On tap callback
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.accents.blue.withOpacity(0.3),
        border: Border.all(color: colors.accents.blue),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: colors.components.blocks.border,
          splashColor: colors.components.blocks.border,
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Ink(
            width: width,
            height: height,
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
            child: Container(
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
