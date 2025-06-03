import 'package:eng_mhamdino_flutter_task/features/home/presentation/view/expanses_screen.dart';
import 'package:eng_mhamdino_flutter_task/features/home/presentation/view/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../features/login/data/model/user_model.dart';
import '../app_routes.dart';

class HomeRouteGenerator implements RouteGenerator {
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              MainHomeScreen(userModel: settings.arguments as UserModel?),
        );
      case AppRoutes.viewAllExpenses:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MainHomeScreen(),
        );

      default:
        return null;
    }
  }
}
