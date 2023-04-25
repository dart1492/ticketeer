import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/auth/domain/repositories/auth_repository.dart';
import 'package:ticketeer/features/auth/domain/repositories/token_repository.dart';
import 'package:ticketeer/features/auth/presentation/cubits/otp_cubit/otp_cubit_state.dart';

/// This cubit accepts otp and exchanges it for an access token
class OtpCubit extends Cubit<OtpCubitState> {
  /// Auth repository
  final AuthRepository authRepo;

  /// Token repository
  final TokenRepository tokenRepo;

  /// This cubit accepts otp and exchanges it for an access token
  OtpCubit({
    required this.authRepo,
    required this.tokenRepo,
  }) : super(
          AcceptingOtpState(
            isValidated: true,
            otp: '',
            phoneNumber: "",
          ),
        );

  /// Sets the phone number on create for this cubit
  void setPhoneNumber(String phoneNumber) {
    emit(
      (state as AcceptingOtpState).copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  /// Get access token with the otp
  Future<void> getAccess(String otp) async {
    final String phone = (state as AcceptingOtpState).phoneNumber;
    final result = await authRepo.getToken(
      otp,
      (state as AcceptingOtpState).phoneNumber,
    );
    result.fold(
      (l) {
        emit(
          ErrorOtpState(errorMessage: l.errorMessage),
        );
        emit(
          AcceptingOtpState(
            otp: otp,
            isValidated: true,
            phoneNumber: phone,
          ),
        );
      },
      (r) {
        tokenRepo.setToken(r);
        emit(SuccessOtpState());
      },
    );
  }
}
