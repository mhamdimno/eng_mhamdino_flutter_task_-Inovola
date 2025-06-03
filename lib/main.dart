import 'package:flutter/material.dart';

import 'core/app/app_manager.dart';
import 'core/app/app_manager_env.dart';
import 'package:flutter_bug_logger/flutter_logger.dart';

void main() async {
  Logger.init(
    true,
    isShowFile: false,
    isShowTime: false,
    isShowNavigation: true,
    levelVerbose: 247,
    levelDebug: 26,
    levelInfo: 28,
    levelWarn: 3,
    levelError: 9,
    phoneVerbose: Colors.white54,
    phoneDebug: Colors.blue,
    phoneInfo: Colors.green,
    phoneWarn: Colors.yellow,
    phoneError: Colors.redAccent,
  );

  AppManager.instance.init(AppManagerEnv.dev);
  AppManager.instance.run();
}
