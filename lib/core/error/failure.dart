// ignore_for_file: lines_longer_than_80_chars

import 'package:ticketeer/core/error/error_model.dart';

/// Failure object - kind of like a custom error object.
class Failure {
  /// Message of this failure
  final String errorMessage;

  /// optional data of the error
  final List<ErrorModel>? errorData;

  /// Optional code of the error
  final int? errorCode;

  /// Failure object - kind of like a custom error object.
  Failure({
    this.errorMessage = 'Something went wrong',
    this.errorCode,
    this.errorData,
  });

  @override
  String toString() {
    return "Failure(errorMessage: $errorMessage, errorData $errorData, errorCode: $errorCode)";
  }
}
