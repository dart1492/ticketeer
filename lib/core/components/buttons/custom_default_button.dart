import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// Button with default, not highlighted colors:
/// (components.blocs.background) for body and (components.blocs.border)
/// Usually is used for other choices that user can make other then
/// the desired one
class CustomDefaultButton extends StatelessWidget {
  /// Button with default, not highlighted colors:
  /// (components.blocs.background) for body and (components.blocs.border)
  /// Usually is used for other choices that user can make other then
  /// the desired one
  const CustomDefaultButton({
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
        color: colors.components.blocks.background,
        border: Border.all(color: colors.components.blocks.border),
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
                  vertical: 10,
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
