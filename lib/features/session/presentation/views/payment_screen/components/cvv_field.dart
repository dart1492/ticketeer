import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_cubit.dart';

/// cvv field
class CvvField extends StatefulWidget {
  /// cvv field
  const CvvField({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  @override
  State<CvvField> createState() => _CvvFieldState();
}

class _CvvFieldState extends State<CvvField> {
  final FocusNode node = FocusNode();

  @override
  void initState() {
    node.addListener(() {
      if (node.hasFocus) {
        context.read<PaymentCubit>().focusCvv();
      }

      if (!node.hasFocus) {
        context.read<PaymentCubit>().unfocusCvv();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CustomTextField(
        onTap: () {
          context.read<PaymentCubit>().clearValidation(
                cvv: true,
              );
        },
        focusNode: node,
        isObscured: true,
        charLimit: 3,
        labelText: "${widget._basePath}labels.cvv".tr(),
        keyboardType: TextInputType.number,
        borderRadius: BorderRadius.circular(5),
        onChanged: (p0) {
          context.read<PaymentCubit>().updateValues(
                cvv: p0,
              );
        },
      ),
    );
  }
}
