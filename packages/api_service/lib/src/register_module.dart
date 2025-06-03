import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @Named('RefreshDio')
  Dio dioRefresh(@Named('BaseUrl') String url) =>
      Dio(BaseOptions(baseUrl: url));
}
