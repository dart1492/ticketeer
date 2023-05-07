import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/components/static_elements/validation_error_box.dart';
import 'package:ticketeer/core/util/custom_formatters.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_state.dart';
import 'package:ticketeer/features/session/presentation/views/payment_screen/components/cvv_field.dart';

/// Row with cvv and date fields
class DateCvvRow extends StatelessWidget {
  /// Row with cvv and date fields
  const DateCvvRow({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<PaymentCubit, GeneralPaymentState>(
              builder: (context, state) {
                return ValidationErrorBox(
                  errorText: "${_basePath}invalid.date".tr(),
                  isShown: state.isDateValidated,
                );
              },
            ),
            SizedBox(
              width: 170,
              child: CustomTextField(
                onTap: () {
                  context.read<PaymentCubit>().clearValidation(
                        date: true,
                      );
                },
                charLimit: 5,
                formatters: [CardExpirationFormatter()],
                labelText: "${_basePath}labels.date".tr(),
                keyboardType: TextInputType.number,
                borderRadius: BorderRadius.circular(5),
                onChanged: (p0) {
                  context.read<PaymentCubit>().updateValues(
                        expirationDate: p0,
                      );
                },
              ),
            ),
          ],
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<PaymentCubit, GeneralPaymentState>(
              builder: (context, state) {
                return ValidationErrorBox(
                  errorText: "${_basePath}invalid.cvv".tr(),
                  isShown: state.isCvvValidated,
                );
              },
            ),
            CvvField(basePath: _basePath),
          ],
        ),
      ],
    );
  }
}
