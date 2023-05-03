import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/custom_formatters.dart';
import 'package:ticketeer/features/auth/presentation/views/components/error_box.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_state.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen where user can pay for his booked tickets
class PaymentScreen extends StatelessWidget {
  /// Screen where user can pay for his tickets
  const PaymentScreen({super.key});

  static const _basePath = "screens.payment.";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<PaymentCubit>(),
      child: Scaffold(
        backgroundColor: colors.backgrounds.main,
        appBar: AppBar(
          toolbarHeight: 50,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 100,
          leading: GestureDetector(
            onTap: () {
              context.popRoute();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: colors.accents.blue,
                    size: 20,
                  ),
                  Text(
                    "components.app-bar.back".tr(),
                    style: open.s18.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<PaymentCubit, GeneralPaymentState>(
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
                  showBackView:
                      false, //true when you want to show cvv(back) view
                );
              },
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        BlocBuilder<PaymentCubit, GeneralPaymentState>(
                          builder: (context, state) {
                            return ErrorBox(
                              errorText: "${_basePath}invalid.email".tr(),
                              isShown: state.isNumberValidated,
                            );
                          },
                        ),
                        CustomTextField(
                          labelText: "${_basePath}labels.email".tr(),
                          borderRadius: BorderRadius.circular(5),
                          onChanged: (p0) {
                            context
                                .read<PaymentCubit>()
                                .updateValues(email: p0);
                          },
                        ),
                        BlocBuilder<PaymentCubit, GeneralPaymentState>(
                          builder: (context, state) {
                            return ErrorBox(
                              errorText: "${_basePath}invalid.card".tr(),
                              isShown: state.isNumberValidated,
                            );
                          },
                        ),
                        CustomTextField(
                          labelText: "${_basePath}labels.card".tr(),
                          keyboardType: TextInputType.number,
                          borderRadius: BorderRadius.circular(5),
                          onChanged: (p0) {
                            context
                                .read<PaymentCubit>()
                                .updateValues(cardNumber: p0);
                          },
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                BlocBuilder<PaymentCubit, GeneralPaymentState>(
                                  builder: (context, state) {
                                    return ErrorBox(
                                      errorText:
                                          "${_basePath}invalid.date".tr(),
                                      isShown: state.isNumberValidated,
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 170,
                                  child: CustomTextField(
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
                              children: [
                                BlocBuilder<PaymentCubit, GeneralPaymentState>(
                                  builder: (context, state) {
                                    return ErrorBox(
                                      errorText: "${_basePath}invalid.cvv".tr(),
                                      isShown: state.isNumberValidated,
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 100,
                                  child: CustomTextField(
                                    isObscured: true,
                                    charLimit: 3,
                                    labelText: "${_basePath}labels.cvv".tr(),
                                    keyboardType: TextInputType.number,
                                    borderRadius: BorderRadius.circular(5),
                                    onChanged: (p0) {
                                      context.read<PaymentCubit>().updateValues(
                                            cvv: p0,
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          childAlignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${_basePath}buy".tr(),
                            style: open.s24.w700.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
