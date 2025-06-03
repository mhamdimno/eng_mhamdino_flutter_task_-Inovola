import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_service_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  group('SharedPreferencesService', () {
    late SharedPreferencesService service;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      service = SharedPreferencesServiceImpl(mockSharedPreferences);
    });

    test('should save string value to shared preferences', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(mockSharedPreferences.setString(key, value)).thenAnswer((realInvocation) async => true);
      // Act
      await service.saveString(key, value);

      // Assert
      verify(mockSharedPreferences.setString(key, value));
    });

    test('should get string value from shared preferences', () {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      when(mockSharedPreferences.getString(key)).thenReturn(value);

      // Act
      final result = service.getString(key);

      // Assert
      expect(result, equals(value));
    });

    test('should return default value when getting non-existent key', () {
      // Arrange
      const key = 'non_existent_key';
      const defaultValue = 'default_value';
      when(mockSharedPreferences.getString(key)).thenReturn(defaultValue);

      // Act
      final result = service.getString(key, defaultValue: defaultValue);

      // Assert
      expect(result, equals(defaultValue));
    });

    // Add more tests for other methods in SharedPreferencesService
  });
}
