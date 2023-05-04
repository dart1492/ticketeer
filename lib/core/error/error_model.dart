// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Model for error, that gets from the server -
/// can contain multiple error messages
// ignore_for_file: avoid_dynamic_calls

/// Model for error
class ErrorModel {
  /// property, on which the error occurred
  String? property;

  /// error text
  String? error;

  /// Model for error
  ErrorModel({
    this.property,
    this.error,
  });

  ErrorModel copyWith({
    String? property,
    String? error,
  }) {
    return ErrorModel(
      property: property ?? this.property,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'property': property,
      'error': error,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      property: map['property'] != null ? map['property'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorModel(property: $property, error: $error)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;

    return other.property == property && other.error == error;
  }

  @override
  int get hashCode => property.hashCode ^ error.hashCode;
}
