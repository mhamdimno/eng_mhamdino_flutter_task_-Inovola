import 'dart:async';
import 'dart:developer';
import 'package:eng_mhamdino_flutter_task/core/local_service/objectbox_service.dart';
import 'package:flutter/material.dart';
import '../../features/app/presentation/screens/app_screen.dart';
import '../di/di.dart';
import 'app_manager_env.dart';

class AppManager {
  AppManager._();

  static final AppManager instance = AppManager._();

  AppManagerEnv _env = AppManagerEnv.dev;

  AppManagerEnv get env => _env;

  bool get isAqa => _env == AppManagerEnv.testing;

  bool get isDev => _env == AppManagerEnv.dev;

  void init(AppManagerEnv env) {
    _env = env;
  }

  void run() {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await configureDependencies(_env.dependencyInjectionEnv);
        // await ObjectBoxService.create();

        runApp(AppScreen());
      },
      (Object error, StackTrace stackTrace) {
        log(error.toString());
      },
    );
  }
}
