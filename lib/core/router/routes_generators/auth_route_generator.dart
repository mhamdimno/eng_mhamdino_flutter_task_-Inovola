import '../../../features/login/presentaion/view/login_screen.dart';
import '../app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AuthRouteGenerator implements RouteGenerator {
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginScreen());

      default:
        return null;
    }
  }
}
