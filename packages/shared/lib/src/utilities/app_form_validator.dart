/*
 * AppFormValidator is a utility class to validate form fields
 * It is used to validate form fields in the app
/// A utility class for validating application data.
/// Example usage:
/// ```dart

/// bool isValid = AppValidator().requiredField('', 'message').validate(data);
/// ```
 */

typedef Validation = String? Function(String? value);

class AppFormValidator {
  final List<Validation> _validations = [];

  AppFormValidator requiredField(String message) {
    _validations.add((value) {
      if (value?.isEmpty ?? true) return message;
      return null;
    });
    return this;
  }

  AppFormValidator confirmPassword(String password, String message) {
    _validations.add((value) {
      if (value != password) return message;
      return null;
    });
    return this;
  }

  AppFormValidator isNumber(String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator minLength(int length, String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        if (value!.length < length) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator maxLength(int length, String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        if (value!.length > length) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator isPhoneNumber(String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        if (!RegExp(r'^[0-9]{10,11}$').hasMatch(value!)) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator isEmail(String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator isPassword(String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        // Password must be at least 6 characters long
        if (value!.length < 6) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  AppFormValidator isTrinidadTobagoPhoneNumber(String message) {
    _validations.add((value) {
      if (value?.isNotEmpty ?? false) {
        // Regex to validate Trinidad and Tobago phone numbers
        if (!RegExp(r'^\+1\s?\(868\)\s?[2-9]\d{6}$').hasMatch(value!)) {
          return message;
        }
      }
      return null;
    });
    return this;
  }

  String? validate(String? value) {
    for (var validation in _validations) {
      var result = validation(value);
      if (result != null) return result;
    }
    return null;
  }
}
