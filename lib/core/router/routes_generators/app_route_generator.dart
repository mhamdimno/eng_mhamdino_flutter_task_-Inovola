import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AppRouteGenerator implements RouteGenerator {
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.verificationScreen:
      //   return MaterialPageRoute<dynamic>(
      //       builder: (_) => VerificationScreen(phoneNumber: settings.arguments as String), settings: settings);

      default:
        return null;
    }
  }
}
