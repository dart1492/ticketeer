import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_cubit.dart';

/// Phone field
class PhoneField extends StatefulWidget {
  /// Phone field
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
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
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

    return CustomTextField(
      charLimit: 15,
      onTap: () => context.read<PhoneCubit>().resetPhoneNumberField(),
      onChanged: (value) => context.read<PhoneCubit>().updatePhoneNumber(value),
      focusNode: focusNode,
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      keyboardType: TextInputType.number,
      borderRadius: BorderRadius.circular(5),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(
          FeatherIcons.phone,
          color:
              isFocused ? colors.accents.blue : colors.components.blocks.border,
        ),
      ),
    );
  }
}
