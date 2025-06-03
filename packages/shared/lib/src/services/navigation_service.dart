import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../interfaces/bottom_sheet_rout_generator.dart';

typedef BottomSheetRoute = Widget Function(Object?);

@lazySingleton
class NavigationService {
  NavigationService(this._navigator, this.bottomSheetRoutes);
  final GlobalKey<NavigatorState> _navigator;
  final BottomSheetRouteGenerator bottomSheetRoutes;

  Future<dynamic> routeTo(String route, {Object? arguments}) {
    return _navigator.currentState!.pushNamed(route, arguments: arguments);
  }

  /// Navigate to a widget.
  ///
  /// This method navigates to a given [screen] using [MaterialPageRoute].
  ///
  /// The screen is the widget that will be displayed as the new route.
  ///
  /// Returns a [Future] that resolves when the pushed route is popped off the navigator that most tightly encloses the given `context`.
  Future<dynamic> routeToWidget(Widget screen) {
    return _navigator.currentState!.push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void pop<T>([T? result]) {
    return _navigator.currentState!.pop(result);
  }

  void popUntil<T>(RoutePredicate predicate) {
    return _navigator.currentState!.popUntil(predicate);
  }

  Future<dynamic> replaceRoute(String route, {Object? arguments}) {
    return _navigator.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  Future<dynamic> routeAndPopUntil(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments}) {
    return _navigator.currentState!
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  Future<dynamic> openBottomSheet(String newRouteName, {Object? arguments}) {
    return showCupertinoModalBottomSheet(
      context: context!,
      useRootNavigator: true,
      builder: (_) =>
          bottomSheetRoutes.generateRoute()[newRouteName]!(arguments),
    );
  }

  BuildContext? get context => _navigator.currentContext;
}
