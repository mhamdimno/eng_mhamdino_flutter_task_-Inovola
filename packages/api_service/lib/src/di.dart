import 'package:api_service/src/interceptors/logger_interceptor.dart';
import 'package:api_service/src/interceptors/token_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

@InjectableInit()
void apiServiceConfigureDependencies(GetIt getIt, String env) {
  getIt.init(environment: env);
  getIt<TokenInterceptor>();
  getIt<LoggerInterceptor>();
}
