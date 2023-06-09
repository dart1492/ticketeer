// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Stylized textfield
class CustomTextField extends StatelessWidget {
  final void Function()? onTap;

  final void Function(String)? onChanged;

  final EdgeInsetsGeometry? contentPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final Widget? prefixIcon;

  final BorderRadius? borderRadius;

  final String? labelText;

  final TextInputType? keyboardType;

  final int? charLimit;

  final List<TextInputFormatter>? formatters;

  final bool? isObscured;

  /// Stylized textfield
  const CustomTextField({
    super.key,
    this.onTap,
    this.onChanged,
    this.contentPadding,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.borderRadius,
    this.labelText,
    this.keyboardType,
    this.formatters,
    this.charLimit,
    this.isObscured,
  });

  static final BorderRadius _defaultBorderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return TextField(
      obscureText: isObscured ?? false,
      inputFormatters: formatters,
      maxLength: charLimit,
      keyboardType: keyboardType,
      focusNode: focusNode,
      cursorWidth: 1,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      cursorColor: colors.accents.blue,
      style: roboto.s16.copyWith(color: colors.fonts.main),
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: roboto.s16.copyWith(color: colors.fonts.secondary),
        fillColor: colors.components.blocks.background,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.components.blocks.border,
          ),
          borderRadius: borderRadius ?? _defaultBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accents.blue,
          ),
          borderRadius: borderRadius ?? _defaultBorderRadius,
        ),
      ),
    );
  }
}
