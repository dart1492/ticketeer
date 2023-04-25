// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtpCubitState {}

class AcceptingOtpState extends OtpCubitState {
  String otp;
  String phoneNumber;
  bool isValidated;
  AcceptingOtpState({
    required this.otp,
    required this.isValidated,
    required this.phoneNumber,
  });

  AcceptingOtpState copyWith({
    String? otp,
    String? phoneNumber,
    bool? isValidated,
  }) {
    return AcceptingOtpState(
      isValidated: isValidated ?? this.isValidated,
      otp: otp ?? this.otp,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

class ErrorOtpState extends OtpCubitState {
  String errorMessage;
  ErrorOtpState({
    required this.errorMessage,
  });
}

class SuccessOtpState extends OtpCubitState {
  SuccessOtpState();
}
