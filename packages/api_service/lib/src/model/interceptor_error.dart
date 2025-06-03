import 'package:dio/dio.dart';

class InterceptorError extends DioException {
  String errorMessage;
  InterceptorError({required super.requestOptions, required this.errorMessage});
  @override
  String toString() => errorMessage;
}
