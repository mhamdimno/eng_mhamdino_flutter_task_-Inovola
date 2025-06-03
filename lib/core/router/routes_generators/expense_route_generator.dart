import 'package:eng_mhamdino_flutter_task/features/crudExpense/add_expense/presentation/view/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../app_routes.dart';

class ExpenseRouteGenerator implements RouteGenerator {
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.addExpense:
        return MaterialPageRoute<dynamic>(
            //parms: settings.arguments as String
            builder: (_) => AddExpenseScreen(),
            settings: settings);

      default:
        return null;
    }
  }
}
