// ignore_for_file: parameter_assignments,
// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/util/validators.dart';
import 'package:ticketeer/features/session/data/models/payment_credentials_model.dart';
import 'package:ticketeer/features/session/domain/entities/payment_credentials.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';
import 'package:ticketeer/features/session/presentation/cubits/payment_cubit/payment_state.dart';

/// Cubit for accepting payment info, validating it and sending to the host
class PaymentCubit extends Cubit<GeneralPaymentState> {
  /// Session repository
  final SessionRepository repo;

  /// Cubit for accepting payment info, validating it and sending to the host
  PaymentCubit(this.repo)
      : super(
          GeneralPaymentState(
            cardNumber: "",
            email: "",
            expirationDate: "",
            cvv: "",
            isCvvValidated: true,
            isDateValidated: true,
            isEmailValidated: true,
            isNumberValidated: true,
            isCvvFocused: false,
            isSuccess: false,
          ),
        );

  /// Update values inside of the state
  void updateValues({
    String? cardNumber,
    String? email,
    String? expirationDate,
    String? cvv,
  }) {
    emit(
      state.copyWith(
        cardNumber: cardNumber,
        isNumberValidated: cardNumber == null ? state.isNumberValidated : true,
        email: email,
        isEmailValidated: email == null ? state.isEmailValidated : true,
        expirationDate: expirationDate,
        isDateValidated: expirationDate == null ? state.isDateValidated : true,
        cvv: cvv,
        isCvvValidated: cvv == null ? state.isCvvValidated : true,
      ),
    );
  }

  /// Validate inputted values on submit
  bool validateValues() {
    final bool isNumberValid = CreditCardValidators.validateCardNumber(
      state.cardNumber,
    );
    // final bool isDateValid = true;
    final bool isDateValid = CreditCardValidators.validateExpirationDate(
      state.expirationDate,
    );
    final bool isEmailValid = CreditCardValidators.validateEmail(
      state.email,
    );
    final bool isCvvValid = CreditCardValidators.validateCvv(
      state.cvv,
    );

    emit(
      state.copyWith(
        isCvvValidated: isCvvValid,
        isEmailValidated: isEmailValid,
        isDateValidated: isDateValid,
        isNumberValidated: isNumberValid,
      ),
    );

    return isNumberValid && isDateValid && isEmailValid && isCvvValid;
  }

  /// Focus on the cvv field and flip the card
  void focusCvv() {
    emit(
      state.copyWith(isCvvFocused: true),
    );
  }

  /// Clear validation
  void clearValidation({bool? email, bool? card, bool? date, bool? cvv}) {
    emit(
      state.copyWith(
        isEmailValidated: email,
        isNumberValidated: card,
        isCvvValidated: cvv,
        isDateValidated: date,
      ),
    );
  }

  /// Unfocus from the cvv field
  void unfocusCvv() {
    emit(
      state.copyWith(isCvvFocused: false),
    );
  }

  /// reset error state
  void resetError() {
    emit(
      state.copyWith(errorText: null),
    );
  }

  /// Purchase tickets for the movie
  Future<void> purchaseTickets(List<int> seatIds, int sessionId) async {
    final PaymentCredentials credits = PaymentCredentialsModel(
      email: state.email,
      cardNumber: state.cardNumber,
      cvv: state.cvv,
      expirationDate: state.expirationDate,
    );
    final result = await repo.buyTickets(seatIds, sessionId, credits);
    result.fold(
      (l) {
        if (l.errorCode == 422 && l.errorData != null) {
          emit(
            state.copyWith(
              errorText: l.errorData![0].error,
            ),
          );
        } else {
          emit(
            state.copyWith(
              errorText: l.errorMessage,
            ),
          );
        }
      },
      (r) => emit(
        state.copyWith(
          isSuccess: true,
        ),
      ),
    );
  }
}
