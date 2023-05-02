// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentCredentials {
  String email;
  String cardNumber;
  String cvv;
  String expirationDate;
  PaymentCredentials({
    required this.email,
    required this.cardNumber,
    required this.cvv,
    required this.expirationDate,
  });
}
