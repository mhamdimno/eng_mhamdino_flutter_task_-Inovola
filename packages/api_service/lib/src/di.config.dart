// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_service/api_service.dart' as _i54;
import 'package:api_service/src/api_service/dio_api_service.dart' as _i375;

import 'package:api_service/src/interceptors/logger_interceptor.dart' as _i370;
import 'package:api_service/src/interceptors/token_interceptor.dart' as _i473;
import 'package:api_service/src/register_module.dart' as _i669;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));

    gh.factory<_i361.Dio>(
      () => registerModule.dioRefresh(gh<String>(instanceName: 'BaseUrl')),
      instanceName: 'RefreshDio',
    );

    gh.lazySingleton<_i473.TokenInterceptor>(() => _i473.TokenInterceptor(
          gh<_i811.LanguageService>(),
          gh<_i811.TokenService>(),
          gh<_i811.AuthService>(),
          gh<_i361.Dio>(),
        ));
    gh.lazySingleton<_i370.LoggerInterceptor>(() => _i370.LoggerInterceptor(
          gh<_i811.Logger>(),
          gh<_i361.Dio>(),
        ));
    gh.lazySingleton<_i54.ApiService>(() => _i375.DioApiService(
          gh<_i361.Dio>(),
          tokenService: gh<_i811.TokenService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i669.RegisterModule {}
