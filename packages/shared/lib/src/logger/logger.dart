import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bug_logger/console_overlay.dart';
import 'package:flutter_bug_logger/flutter_logger.dart' as logger;
import 'package:injectable/injectable.dart';

@lazySingleton
class Logger {
  showOverlay(BuildContext context) {
    ConsoleOverlay.show(context);
  }

  String jsonToString(json) {
    if (json == null) return '';
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  void logApi(String apiType, String path, Map<String?, dynamic> body, Map<String?, dynamic> response) {
    logger.Logger.d('$apiType Path :$path \n Body:${jsonToString(body)} \n Response: ${jsonToString(response)} ');
  }

  void verbose(dynamic message) {
    logger.Logger.v(message);
  }

  void debug(dynamic message) {
    logger.Logger.d(message);
  }

  void info(dynamic message) {
    logger.Logger.i(message);
  }

  void warning(dynamic message) {
    logger.Logger.w(message);
  }

  void error(dynamic message) {
    logger.Logger.e(message);
  }

  void fatalError(dynamic message) {
    logger.Logger.e(message);
  }
}
