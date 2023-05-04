/// Collection of field validators
// ignore_for_file: parameter_assignments

class CreditCardValidators {
  /// Validate card number
  static bool validateCardNumber(String input) {
    // Remove any whitespace from the input

    input = input.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    // Check if the input is empty or contains non-digit characters
    if (input.isEmpty || !RegExp(r'^\d+$').hasMatch(input)) {
      return false;
    }

    // Check if the input is a valid credit card number using the Luhn algorithm
    int sum = 0;
    bool isSecondDigit = false;
    for (int i = input.length - 1; i >= 0; i--) {
      int digit = int.parse(input[i]);
      if (isSecondDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      isSecondDigit = !isSecondDigit;
    }
    return sum % 10 == 0;
  }

  /// Validate expiration date of the credit card
  static bool validateExpirationDate(String input) {
    // Remove any whitespace from the input
    input = input.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    // Check if the input is empty or doesn't match the format MM/YY
    if (input.isEmpty || !RegExp(r'^\d{2}/\d{2}$').hasMatch(input)) {
      return false;
    }

    // Split the input into month and year components
    final List<String> components = input.split('/');
    final int month = int.parse(components[0]);
    int year = int.parse(components[1]);

    // Check if the month is between 1 and 12
    if (month < 1 || month > 12) {
      return false;
    }

    // Get the current year and add 2000 to match the YY format
    final int currentYear = DateTime.now().year % 100 + 2000;
    year = 2000 + year;
    // Check if the year is in the future or within the next 10 years
    if (year < currentYear || year > currentYear + 10) {
      return false;
    }

    // Check if the expiration date has already passed
    if (year == currentYear && month < DateTime.now().month) {
      return false;
    }

    return true;
  }

  /// Validate email
  static bool validateEmail(String input) {
    // Check if the input is empty or doesn't match the email address format
    if (input.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(input)) {
      return false;
    }

    return true;
  }

  /// Validate cvv number
  static bool validateCvv(String input) {
    // Remove any whitespace from the input
    input = input.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    // Check if the input is empty or contains non-digit characters
    if (input.isEmpty || !RegExp(r'^\d+$').hasMatch(input)) {
      return false;
    }

    // Check if the input has a valid length (3 or 4 digits)
    if (input.length != 3 && input.length != 4) {
      return false;
    }

    return true;
  }
}
