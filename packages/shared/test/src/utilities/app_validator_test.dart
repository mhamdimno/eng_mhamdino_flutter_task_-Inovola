import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  group('AppFormValidator', () {
    late AppFormValidator validator;

    setUp(() {
      validator = AppFormValidator();
    });

    test('requiredField should return an error message if value is empty', () {
      const message = 'Field is required';
      final result = validator.requiredField(message).validate('');

      expect(result, equals(message));
    });

    test('requiredField should return null if value is not empty', () {
      const message = 'Field is required';
      final result = validator.requiredField(message).validate('Some value');

      expect(result, isNull);
    });

    test('confirmPassword should return an error message if passwords do not match', () {
      const message = 'Passwords do not match';
      final result = validator.confirmPassword('password1', message).validate('password1');

      expect(result, equals(message));
    });

    test('confirmPassword should return null if passwords match', () {
      const message = 'Passwords do not match';
      final result = validator.confirmPassword('password1', message).validate('password1');

      expect(result, isNull);
    });
  });
}
