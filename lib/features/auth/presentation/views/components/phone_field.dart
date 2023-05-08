import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_cubit.dart';

/// Phone field
class PhoneField extends StatefulWidget {
  final String _basePath;

  /// Phone field
  const PhoneField({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

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
    final cubit = context.read<PhoneCubit>();
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Theme(
      data: ThemeData(
        useMaterial3: false,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          subtitle1: open.s16.copyWith(
            color: colors.fonts.main,
          ),
        ),
      ),
      child: IntlPhoneField(
        flagsButtonMargin: const EdgeInsets.only(bottom: 3),
        onTap: () {
          cubit.resetPhoneNumberField();
        },
        pickerDialogStyle: PickerDialogStyle(
          searchFieldCursorColor: colors.accents.blue,
          searchFieldInputDecoration: InputDecoration(
            labelText: "${widget._basePath}country".tr(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: open.s16.copyWith(
              color: colors.fonts.secondary,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors.fonts.secondary,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: colors.accents.blue,
              ),
            ),
          ),
          backgroundColor: colors.backgrounds.secondary,
          countryNameStyle: open.s16.copyWith(
            color: colors.fonts.main,
          ),
          countryCodeStyle: open.s16.copyWith(
            color: colors.accents.blue,
          ),
          listTileDivider: const SizedBox(
            height: 4,
            width: double.infinity,
          ),
        ),
        focusNode: focusNode,
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          color:
              isFocused ? colors.accents.blue : colors.components.blocks.border,
        ),
        dropdownTextStyle: open.s16.copyWith(
          color: isFocused ? colors.fonts.main : colors.fonts.secondary,
        ),
        // dropdownDecoration: BoxDecoration(
        //   color: colors.components.blocks.background,
        // ),
        autovalidateMode: AutovalidateMode.disabled,
        style: open.s16.copyWith(
          color: colors.fonts.main,
        ),
        decoration: InputDecoration(
          fillColor: colors.components.blocks.background,
          filled: true,
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.components.blocks.border,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.accents.blue,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: "${widget._basePath}phone".tr(),
          labelStyle: open.s16.copyWith(color: colors.fonts.secondary),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        initialCountryCode: 'UA',
        onChanged: (phone) {
          cubit.resetPhoneNumberField();
          cubit.updatePhoneNumber(
            phone.completeNumber,
          );
        },
      ),
    );
  }
}
