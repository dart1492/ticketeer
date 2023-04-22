/// Model for error, that gets from the server -
/// can contain multiple error messages
// ignore_for_file: avoid_dynamic_calls

/// Model for error
class ErrorModel {
  ///
  String? property;

  ///
  List<String>? errors;

  /// Model for error
  ErrorModel({this.property, this.errors});

  /// From map constructor
  ErrorModel.fromJson(Map<String, dynamic> json) {
    final List<String> errorList = [];
    if (json['errors'] != null) {
      json['errors'].forEach((v) => errorList.add(v));
    }
    property = json['property'];
    errors = errorList;
  }

  /// Top map conversion
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['property'] = property;
    data['errors'] = errors;
    return data;
  }

  @override
  String toString() {
    return "ErrorModel(property: $property, error $errors)";
  }
}
