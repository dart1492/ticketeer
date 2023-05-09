import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ticketeer/core/components/buttons/custom_default_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';

/// Otp textField
class OtpField extends StatefulWidget {
  final String _basePath;

  /// Otp textField
  const OtpField({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  bool isClear = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Column(
      children: [
        OtpTextField(
          autoFocus: true,
          styles: [
            roboto.s16.copyWith(
              color: colors.fonts.main,
            ),
            roboto.s16.copyWith(
              color: colors.fonts.main,
            ),
            roboto.s16.copyWith(
              color: colors.fonts.main,
            ),
            roboto.s16.copyWith(
              color: colors.fonts.main,
            ),
          ],
          clearText: isClear,
          fillColor: colors.components.blocks.background,
          filled: true,
          numberOfFields: 4,
          focusedBorderColor: colors.accents.blue,
          enabledBorderColor: colors.components.blocks.border,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {},
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            context.read<OtpCubit>().getAccess(verificationCode);
          }, // end onSubmit
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDefaultButton(
          width: 120,
          child: Text(
            "${widget._basePath}clear".tr(),
            style: roboto.s18.copyWith(
              color: colors.fonts.main,
            ),
          ),
          onTap: () {
            setState(() {
              isClear = true;
            });
          },
        ),
      ],
    );
  }
}
