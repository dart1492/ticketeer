// ignore_for_file: public_member_api_docs, sort_constructors_first

class GeneralPaymentState {
  String cardNumber;
  String email;
  String expirationDate;
  String cvv;
  bool isNumberValidated;
  bool isEmailValidated;
  bool isDateValidated;
  bool isCvvValidated;

  GeneralPaymentState({
    required this.cardNumber,
    required this.email,
    required this.expirationDate,
    required this.cvv,
    required this.isNumberValidated,
    required this.isEmailValidated,
    required this.isDateValidated,
    required this.isCvvValidated,
  });

  GeneralPaymentState copyWith({
    String? cardNumber,
    String? email,
    String? expirationDate,
    String? cvv,
    bool? isNumberValidated,
    bool? isEmailValidated,
    bool? isDateValidated,
    bool? isCvvValidated,
  }) {
    return GeneralPaymentState(
      cardNumber: cardNumber ?? this.cardNumber,
      email: email ?? this.email,
      expirationDate: expirationDate ?? this.expirationDate,
      cvv: cvv ?? this.cvv,
      isNumberValidated: isNumberValidated ?? this.isNumberValidated,
      isEmailValidated: isEmailValidated ?? this.isEmailValidated,
      isDateValidated: isDateValidated ?? this.isDateValidated,
      isCvvValidated: isCvvValidated ?? this.isCvvValidated,
    );
  }
}
