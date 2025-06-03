// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../../features/app/presentation/screens/splash_screen.dart';
import '../app_routes.dart';

class InitRouteGenerator implements RouteGenerator {
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return null;
    }
  }
}
