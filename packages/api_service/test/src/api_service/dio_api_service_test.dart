import 'package:api_service/src/api_service/dio_api_service.dart';
import 'package:api_service/src/interceptors/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dio_api_service_test.mocks.dart';

@GenerateMocks([
  TokenInterceptor,
  LoggerInterceptor,
], customMocks: [
  MockSpec<Dio>(onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  group('DioApiService', () {
    late DioApiService dioApiService;
    late MockDio dio;
    late TokenInterceptor tokenInterceptor;
    late LoggerInterceptor loggerInterceptor;
    late MockInterceptors interceptors;

    setUpAll(() {
      dio = MockDio();
      interceptors = MockInterceptors();
      tokenInterceptor = MockTokenInterceptor();
      loggerInterceptor = MockLoggerInterceptor();

      when(dio.interceptors).thenReturn(interceptors);
      when(dio.options).thenReturn(BaseOptions());
      dioApiService = DioApiService(
        dio,
      );
    });

    test('should add token and response interceptors', () {
      when(interceptors.add(any)).thenReturn(null);
      verify(interceptors.add(tokenInterceptor)).called(1);
      verify(interceptors.add(loggerInterceptor)).called(1);
    });

    test(
        'should call #Dio.get method '
        'then returns data', () async {
      final expectedResponse = {'data': 'example'};
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
            data: expectedResponse,
            statusCode: 200,
            requestOptions: RequestOptions()),
      );

      final result = await dioApiService.get('path', fromJson: (data) => data);

      expect(result, equals(expectedResponse));
      verify(dio.get(any, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test(
        'should call #Dio.get method '
        'then returns list of data', () async {
      final expectedResponse = [
        {'data': 'example'}
      ];
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
            data: expectedResponse,
            statusCode: 200,
            requestOptions: RequestOptions()),
      );

      final result =
          await dioApiService.getList('path', fromJson: (data) => data);

      expect(result, equals(expectedResponse));
      verify(dio.get(any, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test(
        'should call #Dio.post method '
        'then returns data', () async {
      final expectedResponse = {'data': 'example'};
      when(dio.post(any)).thenAnswer(
        (_) async => Response(
            data: expectedResponse,
            statusCode: 200,
            requestOptions: RequestOptions()),
      );

      final result = await dioApiService.post('path', fromJson: (data) => data);

      expect(result, equals(expectedResponse));
      verify(dio.post(any, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test(
        'should call #Dio.put method '
        'then returns data', () async {
      final expectedResponse = {'data': 'example'};
      when(dio.put(any)).thenAnswer(
        (_) async => Response(
            data: expectedResponse,
            statusCode: 200,
            requestOptions: RequestOptions()),
      );

      final result = await dioApiService.put('path', fromJson: (data) => data);

      expect(result, equals(expectedResponse));
      verify(dio.put(any, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });

    test(
        'should call #Dio.delete method '
        'then returns data', () async {
      final expectedResponse = {'data': 'example'};
      when(dio.delete(any)).thenAnswer(
        (_) async => Response(
            data: expectedResponse,
            statusCode: 200,
            requestOptions: RequestOptions()),
      );

      final result =
          await dioApiService.delete('path', fromJson: (data) => data);

      expect(result, equals(expectedResponse));
      verify(dio.delete(any, queryParameters: anyNamed('queryParameters')))
          .called(1);
    });
  });
}

// Fake class
class MockInterceptors extends Mock implements Interceptors {
  @override
  add(Interceptor? interceptor) {
    super.noSuchMethod(Invocation.method(#start, [interceptor]));
  }
}
