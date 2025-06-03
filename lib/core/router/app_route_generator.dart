// ignore_for_file: always_specify_types
import 'package:eng_mhamdino_flutter_task/core/router/routes_generators/app_route_generator.dart';
import 'package:flutter/material.dart';
import 'package:eng_mhamdino_flutter_task/core/router/routes_generators/auth_route_generator.dart'
    show AuthRouteGenerator;
import 'package:shared/shared.dart';
import 'routes_generators/expense_route_generator.dart';
import 'routes_generators/index.dart';

class AppRoutesGenerator {
  static final List<RouteGenerator> generators = <RouteGenerator>[
    AuthRouteGenerator(),
    InitRouteGenerator(),
    AppRouteGenerator(),
    HomeRouteGenerator(),
    ExpenseRouteGenerator(),
  ];

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    for (final RouteGenerator generator in generators) {
      final Route? route = generator.generateRoute(settings);
      if (route != null) {
        return route;
      }
    }
    // fallback route
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(body: Center(child: Text('Route not found')));
    });
  }
}
