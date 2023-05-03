import 'package:flutter_bloc/flutter_bloc.dart';
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
        email: email,
        expirationDate: expirationDate,
        cvv: cvv,
      ),
    );
  }

  // bool validateCardNumber(String number) {

  // }
  /// Validate inputted values on submit
  void validateValues() {}
}
