// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:ticketeer/features/session/domain/entities/payment_credentials.dart';

class PaymentCredentialsModel extends PaymentCredentials {
  PaymentCredentialsModel({
    required super.email,
    required super.cardNumber,
    required super.cvv,
    required super.expirationDate,
  });

  PaymentCredentialsModel copyWith({
    String? email,
    String? cardNumber,
    String? cvv,
    String? expirationDate,
  }) {
    return PaymentCredentialsModel(
      email: email ?? this.email,
      cardNumber: cardNumber ?? this.cardNumber,
      cvv: cvv ?? this.cvv,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'expirationDate': expirationDate,
    };
  }

  factory PaymentCredentialsModel.fromMap(Map<String, dynamic> map) {
    return PaymentCredentialsModel(
      email: map['email'] as String,
      cardNumber: map['cardNumber'] as String,
      cvv: map['cvv'] as String,
      expirationDate: map['expirationDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentCredentialsModel.fromJson(String source) =>
      PaymentCredentialsModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'PaymentCredentialsModel(email: $email, cardNumber: $cardNumber, cvv: $cvv, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(covariant PaymentCredentials other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.cardNumber == cardNumber &&
        other.cvv == cvv &&
        other.expirationDate == expirationDate;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        cardNumber.hashCode ^
        cvv.hashCode ^
        expirationDate.hashCode;
  }
}
