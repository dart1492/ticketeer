// ignore_for_file: public_member_api_docs, sort_constructors_first
/// General  auth state
class PhoneState {}

/// State for loading (when we exchange otp for an accessToken)
class LoadingPhoneState extends PhoneState {}

/// State for accepting user phone number
class AcceptingPhoneState extends PhoneState {
  String phoneNumber;
  bool isValidated;
  AcceptingPhoneState({
    required this.phoneNumber,
    required this.isValidated,
  });

  AcceptingPhoneState copyWith({
    String? phoneNumber,
    bool? isValidated,
  }) {
    return AcceptingPhoneState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isValidated: isValidated ?? this.isValidated,
    );
  }
}

class ErrorPhoneState extends PhoneState {
  String errorText;
  ErrorPhoneState({
    required this.errorText,
  });
}

class SuccessPhoneState extends PhoneState {
  String phoneNumber;
  SuccessPhoneState({
    required this.phoneNumber,
  });
}
