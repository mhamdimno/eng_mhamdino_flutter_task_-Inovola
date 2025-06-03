// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;
import 'package:shared/src/interfaces/bottom_sheet_rout_generator.dart'
    as _i985;
import 'package:shared/src/interfaces/id_device_service.dart' as _i50;
import 'package:shared/src/interfaces/url_launcher.dart' as _i775;
import 'package:shared/src/logger/logger.dart' as _i14;
import 'package:shared/src/register_module.dart' as _i793;
import 'package:shared/src/services/app_start_service.dart' as _i410;
import 'package:shared/src/services/auth_service.dart' as _i23;
import 'package:shared/src/services/device_id_service.dart' as _i105;
import 'package:shared/src/services/internet_service.dart' as _i829;
import 'package:shared/src/services/language_service_impl.dart' as _i729;
import 'package:shared/src/services/navigation_service.dart' as _i359;
import 'package:shared/src/services/shared_preferences_service.dart' as _i174;
import 'package:shared/src/services/token_service.dart' as _i612;
import 'package:shared/src/services/url_luncher_service.dart' as _i1064;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i14.Logger>(() => _i14.Logger());
    gh.lazySingleton<_i829.InternetService>(() => _i829.InternetService());
    gh.lazySingleton<_i811.AuthService>(() => _i23.AuthServiceImpl());
    gh.factory<_i775.URLLauncher>(() => _i1064.URLLauncherService());
    gh.factory<_i50.DeviceIdService>(() => _i105.DeviceIdServiceImplement());
    gh.lazySingleton<_i174.SharedPreferencesService>(() =>
        _i174.SharedPreferencesServiceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i359.NavigationService>(() => _i359.NavigationService(
          gh<_i409.GlobalKey<_i409.NavigatorState>>(),
          gh<_i985.BottomSheetRouteGenerator>(),
        ));
    gh.factory<_i811.LanguageService>(
        () => _i729.LanguageServiceImpl(gh<_i811.SharedPreferencesService>()));
    gh.factory<_i811.AppStartService>(
        () => _i410.AppStartImpl(gh<_i811.SharedPreferencesService>()));
    gh.factory<_i811.TokenService>(
        () => _i612.TokenServiceImpl(gh<_i811.SharedPreferencesService>()));
    return this;
  }
}

class _$RegisterModule extends _i793.RegisterModule {}
