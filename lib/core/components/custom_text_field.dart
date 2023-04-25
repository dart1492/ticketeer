// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Stylized textfield
class CustomTextField extends StatelessWidget {
  final void Function()? onTap;

  final void Function(String)? onChanged;

  final EdgeInsetsGeometry? contentPadding;

  final TextEditingController? controller;

  /// Stylized textfield
  const CustomTextField({
    super.key,
    this.onTap,
    this.onChanged,
    this.contentPadding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return TextField(
      cursorWidth: 1,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      cursorColor: colors.accents.blue,
      style: open.s16.copyWith(color: colors.fonts.main),
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: open.s14.copyWith(color: colors.fonts.secondary),
        fillColor: colors.components.blocks.background,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.components.blocks.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.accents.blue,
          ),
        ),
      ),
    );
  }
}