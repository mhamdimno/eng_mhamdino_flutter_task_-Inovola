import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@lazySingleton
class LoggerInterceptor extends InterceptorsWrapper {
  final Logger _logger;
  final Dio _dio;
  LoggerInterceptor(this._logger, this._dio) {
    _dio.interceptors.add(this);
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _logger.info('--> ${options.method} ${options.path}\nQueryParam :\n${_logger.jsonToString(options.queryParameters)}\nRequest Data:\n${_logger.jsonToString(options.data)}');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    _logger.info('<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}\nResponse Data: \n ${_logger.jsonToString(response.data)}');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    _logger.error('<-- ${err.response?.statusCode ?? 'Unknown'} ${err.requestOptions.method} ${err.requestOptions.path}/nResponse Data:\n${_logger.jsonToString(err.response?.data)}');

    return super.onError(err, handler);
  }
}
