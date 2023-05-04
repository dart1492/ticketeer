import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_state.dart';

/// Credit card widget
class CreditCard extends StatelessWidget {
  /// Credit card widget
  const CreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocBuilder<PaymentCubit, GeneralPaymentState>(
      builder: (context, state) {
        return CreditCardWidget(
          glassmorphismConfig: Glassmorphism(
            blurX: 7,
            blurY: 7,
            gradient: LinearGradient(
              colors: [
                colors.accents.blue,
                colors.accents.blue.withOpacity(0.5)
              ],
            ),
          ),
          onCreditCardWidgetChange: (p0) {},
          cardNumber: state.cardNumber,
          expiryDate: state.expirationDate,
          cardHolderName: state.email,
          cvvCode: state.cvv,
          showBackView: state.isCvvFocused,
        );
      },
    );
  }
}
