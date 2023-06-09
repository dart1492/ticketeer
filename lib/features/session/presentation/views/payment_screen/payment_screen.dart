import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_text_field.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/components/static_elements/validation_error_box.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_state.dart';
import 'package:ticketeer/features/session/presentation/views/payment_screen/components/credit_card_widget.dart';
import 'package:ticketeer/features/session/presentation/views/payment_screen/components/date_cvv_row.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen where user can pay for his booked tickets
class PaymentScreen extends StatelessWidget {
  /// List of chosen seat ids
  final List<int> seatIds;

  /// Session id
  final int sessionId;

  /// Screen where user can pay for his tickets
  const PaymentScreen({
    super.key,
    required this.seatIds,
    required this.sessionId,
  });

  static const _basePath = "screens.payment.";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return BlocProvider(
      create: (context) => sl<PaymentCubit>(),
      child: BlocListener<PaymentCubit, GeneralPaymentState>(
        listenWhen: (previous, current) {
          if (previous.errorText == null && current.errorText != null) {
            return true;
          }

          if (previous.isSuccess == false && current.isSuccess == true) {
            return true;
          }

          return false;
        },
        listener: (context, state) {
          if (state.errorText != null) {
            showErrorToast(
              text: "${_basePath}error".tr(),
              colors: colors,
            );
          }
          if (state.isSuccess) {
            showSuccessToast(
              text: "${_basePath}success".tr(),
              colors: colors,
            );
            context.router.popUntilRoot();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                      "components.app_bar.back".tr(),
                      style: roboto.s18.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              const CreditCard(),
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        BlocBuilder<PaymentCubit, GeneralPaymentState>(
                          builder: (context, state) {
                            return ValidationErrorBox(
                              errorText: "${_basePath}invalid.email".tr(),
                              isShown: !state.isEmailValidated,
                            );
                          },
                        ),
                        CustomTextField(
                          onTap: () {
                            context.read<PaymentCubit>().clearValidation(
                                  email: true,
                                );
                          },
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
                            return ValidationErrorBox(
                              errorText: "${_basePath}invalid.card".tr(),
                              isShown: !state.isNumberValidated,
                            );
                          },
                        ),
                        CustomTextField(
                          charLimit: 19,
                          onTap: () {
                            context.read<PaymentCubit>().clearValidation(
                                  card: true,
                                );
                          },
                          labelText: "${_basePath}labels.card".tr(),
                          keyboardType: TextInputType.number,
                          borderRadius: BorderRadius.circular(5),
                          onChanged: (p0) {
                            context
                                .read<PaymentCubit>()
                                .updateValues(cardNumber: p0);
                          },
                        ),
                        const DateCvvRow(basePath: _basePath),
                        const SizedBox(
                          height: 40,
                        ),
                        BlocBuilder<PaymentCubit, GeneralPaymentState>(
                          builder: (context, state) {
                            final cubit = context.read<PaymentCubit>();
                            if (state.isLoading) {
                              return SpinKitDualRing(
                                color: colors.accents.blue,
                              );
                            }

                            return CustomButton(
                              onTap: () {
                                if (cubit.validateValues()) {
                                  cubit.purchaseTickets(seatIds, sessionId);
                                }
                              },
                              childAlignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "${_basePath}buy".tr(),
                                style: roboto.s24.w700.copyWith(
                                  color: colors.fonts.main,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
