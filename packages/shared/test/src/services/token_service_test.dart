// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:shared/shared.dart';
// import 'package:uuid/uuid.dart';

// import 'token_service_test.mocks.dart';

// @GenerateMocks([
//   SharedPreferencesService,
//   FlutterSecureStorage,
// ])
// void main() {
//   group('TokenService', () {
//     late TokenService service;
//     late MockSharedPreferencesService mockSharedPreferencesService;
//     late MockFlutterSecureStorage mockFlutterSecureStorage;

//     setUp(() {
//       mockSharedPreferencesService = MockSharedPreferencesService();
//       mockFlutterSecureStorage = MockFlutterSecureStorage();
//       service = TokenServiceImpl(mockSharedPreferencesService, mockFlutterSecureStorage);
//     });

//     test('should get auth token from secure storage', () async {
//       // Arrange
//       const authToken = 'test_auth_token';
//       const secureStorageKey = 'test_secure_storage_key';
//       when(mockSharedPreferencesService.getString(any)).thenReturn(secureStorageKey);
//       when(mockFlutterSecureStorage.read(key: secureStorageKey)).thenAnswer((_) async => authToken);

//       // Act
//       final result = await service.getAuthToken();

//       // Assert
//       expect(result, equals(authToken));
//     });

//     test('should return null when auth token is not set', () async {
//       // Arrange
//       when(mockSharedPreferencesService.getString(any)).thenReturn(null);

//       // Act
//       final result = await service.getAuthToken();

//       // Assert
//       expect(result, isNull);
//     });

//     test('should set auth token in secure storage', () async {
//       // Arrange
//       const accessToken = 'abc123';
//       when(mockSharedPreferencesService.saveString(any, any)).thenAnswer((_) => Future.value());
//       when(mockFlutterSecureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenAnswer((_) => Future.value());

//       // Act
//       await service.setAuthToken(accessToken);

//       // Assert
//       verify(mockSharedPreferencesService.saveString(any, any)).called(1);
//       verify(mockFlutterSecureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).called(1);
//       verifyNoMoreInteractions(mockSharedPreferencesService);
//       verifyNoMoreInteractions(mockFlutterSecureStorage);
//     });

//     test('should clear auth token from secure storage', () async {
//       // Arrange
//       final uuidToken = const Uuid().v4();
//       when(mockSharedPreferencesService.getString(any)).thenReturn(uuidToken);
//       when(mockSharedPreferencesService.removeValue(any)).thenAnswer((_) => Future.value(true));
//       when(mockFlutterSecureStorage.delete(key: anyNamed('key'))).thenAnswer((_) => Future.value());

//       // Act
//       final success = await service.clearAuthToken();

//       // Assert
//       expect(success, isTrue);
//       verify(mockSharedPreferencesService.getString(any)).called(1);
//       verify(mockSharedPreferencesService.removeValue(any)).called(1);
//       verify(mockFlutterSecureStorage.delete(key: uuidToken)).called(1);
//     });

//     test('should return true when auth token is set', () async {
//       // Arrange
//       const authToken = 'test_auth_token';
//       const secureStorageKey = 'test_secure_storage_key';
//       when(mockSharedPreferencesService.getString(any)).thenReturn(secureStorageKey);
//       when(mockFlutterSecureStorage.read(key: secureStorageKey)).thenAnswer((_) async => authToken);

//       // Act
//       final result = await service.isAlreadyLoggedIn();

//       // Assert
//       expect(result, isTrue);
//     });

//     test('should return false when auth token is not set', () async {
//       // Arrange
//       when(mockSharedPreferencesService.getString(any)).thenReturn(null);

//       // Act
//       final result = await service.isAlreadyLoggedIn();

//       // Assert
//       expect(result, isFalse);
//     });
//   });
// }
