import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/cubit/phone_cubit.dart';

/// Phone field
class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final focusNode = FocusNode();
  bool isFocused = false;
  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return TextField(
      onTap: () => context.read<AuthCubit>().resetPhoneNumberField(),
      keyboardType: TextInputType.number,
      onChanged: (value) => context.read<AuthCubit>().updatePhoneNumber(value),
      cursorColor: colors.accents.blue,
      style: open.s16.copyWith(color: colors.fonts.main),
      focusNode: focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: open.s16.copyWith(color: colors.fonts.secondary),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Icon(
            FeatherIcons.phone,
            color: colors.accents.blue,
          ),
        ),
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
