// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// Custom container with predefined border and background colors, radius
class CustomContainer extends StatelessWidget {
  /// Custom container with predefined border and background colors, radius
  const CustomContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.padding,
  });

  final Widget? child;

  final double? height;

  final double? width;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colors.components.blocks.background,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: colors.components.blocks.border,
        ),
      ),
      child: child,
    );
  }
}
