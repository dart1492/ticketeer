import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/constants/reg_exps.dart';
import 'package:ticketeer/features/auth/domain/repositories/auth_repository.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_state.dart';

/// Manages current phone number in the textfield,
/// performs api calls to send an otp, that to retrieve accessToken
class PhoneCubit extends Cubit<PhoneState> {
  /// Repo to perform api calls to, in the end, retrieve the accessToken
  final AuthRepository authRepo;

  /// Manages current phone number in the textfield,
  /// performs api calls to send an otp, that to retrieve accessToken
  PhoneCubit({
    required this.authRepo,
  }) : super(
          AcceptingPhoneState(
            phoneNumber: '',
            isValidated: true,
          ),
        );

  /// updates current phoneNumber value inside of the state
  void updatePhoneNumber(String newPhoneNumber) {
    emit(
      (state as AcceptingPhoneState).copyWith(
        phoneNumber: newPhoneNumber,
        isValidated: true,
      ),
    );
  }

  /// Reset the validation error on the phone field
  void resetPhoneNumberField() {
    emit(
      (state as AcceptingPhoneState).copyWith(
        isValidated: true,
      ),
    );
  }

  /// Get an OTP by phone number. Actually does nothing but changes the state,
  /// because valid otp is already given
  Future<void> getOTP() async {
    final String number = (state as AcceptingPhoneState).phoneNumber;

    if (!phoneRegExp.hasMatch(number)) {
      emit(
        (state as AcceptingPhoneState).copyWith(isValidated: false),
      );
    } else {
      final result = await authRepo.getOTP(number);
      result.fold(
        (l) {
          emit(
            ErrorPhoneState(
              errorText: l.errorMessage,
            ),
          );
          emit(
            AcceptingPhoneState(
              phoneNumber: number,
              isValidated: true,
            ),
          );
        },
        (r) {
          emit(
            SuccessPhoneState(
              phoneNumber: number,
            ),
          );
        },
      );
    }
  }
}
