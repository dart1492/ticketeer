// Custom button, used throughout this.
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// Custom button that have default color of the blue accent with opacity = 0.3,
/// which depends on the current theme and a Border.all with blue accent color
///
class CustomButton extends StatelessWidget {
  /// Child that will be displayed in the center of this button
  final Widget child;

  /// Padding, applied to the child
  final EdgeInsets? padding;

  /// Width of the button. If null - double.infinity
  final double? width;

  /// height of the button. if null - zero
  final double? height;

  /// Alignment of the child widget
  final Alignment? childAlignment;

  /// On tap callback
  final void Function()? onTap;

  /// Color of the background and border, defaults to the AppColors.lightBlue
  final Color? color;

  /// Border radius of the button, defaults to CBorderRadius.all5,
  final BorderRadius? borderRadius;

  /// Border of the button - defaults to the blue colored one with width=3
  final Border? border;

  /// Custom button, used throughout this app
  const CustomButton({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.childAlignment,
    this.onTap,
    this.color,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? colors.accents.blue.withOpacity(0.3),
        border: border ?? Border.all(color: colors.accents.blue),
        borderRadius: borderRadius ?? BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: colors.components.blocks.border,
          splashColor: colors.components.blocks.border,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
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
              alignment: childAlignment,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
