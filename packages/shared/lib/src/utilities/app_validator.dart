abstract class AppValidator{

  static bool hasSpecialChar(String input) => RegExp(r'^.*[!@#$%^&*()].*$').hasMatch(input);
  static bool include1lowercase(String input) => RegExp(r'^.*[a-z].*$').hasMatch(input);
  static bool include1uppercase(String input) => RegExp(r'^.*[A-Z].*$').hasMatch(input);
  static bool include1digit(String input) => RegExp(r'^.*\d.*$').hasMatch(input);
  static bool hasNumericalNumber(String input) => RegExp(r'\d').hasMatch(input);
}
