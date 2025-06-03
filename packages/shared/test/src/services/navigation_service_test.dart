import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared/shared.dart';

import 'navigation_service_test.mocks.dart';

@GenerateMocks([GlobalKey, NavigatorState, BottomSheetRouteGenerator])
void main() {
  group('NavigationService', () {
    late GlobalKey<NavigatorState> navigatorKey;
    late NavigationService navigationService;
    late NavigatorState navigatorState;
    late BottomSheetRouteGenerator bottomSheetRoutes;
    setUp(() {
      // Create a new mock key and state for each test
      navigatorKey = MockGlobalKey<NavigatorState>();
      navigatorState = MockNavigatorState();
      bottomSheetRoutes = MockBottomSheetRouteGenerator();
      // Instantiate the NavigationService with the mock key and state
      navigationService = NavigationService(navigatorKey, bottomSheetRoutes);
      when(navigatorKey.currentState).thenReturn(navigatorState);
    });

    test('routeTo should call Navigator.pushNamed with correct arguments', () async {
      // Arrange
      const routeName = '/test-route';
      final arguments = {'testArg': true};
      when(navigatorState.pushNamed(routeName, arguments: arguments)).thenAnswer((realInvocation) async => null);
      // Act
      await navigationService.routeTo(routeName, arguments: arguments);

      // Assert
      verify(navigatorState.pushNamed(routeName, arguments: arguments)).called(1);
    });

    test('pop should call Navigator.pop with correct arguments', () async {
      // Arrange
      const result = 'test result';

      // Act
      navigationService.pop(result);

      // Assert
      verify(navigatorState.pop(result)).called(1);
    });

    test('popUntil should call Navigator.popUntil with correct arguments', () async {
      // Arrange
      final predicate = ModalRoute.withName('/test-route');

      // Act
      navigationService.popUntil(predicate);

      // Assert
      verify(navigatorState.popUntil(predicate)).called(1);
    });

    test('replaceRoute should call Navigator.pushReplacementNamed with correct arguments', () async {
      // Arrange
      const routeName = '/test-route';
      final arguments = {'testArg': true};
      when(navigatorState.pushReplacementNamed(routeName, arguments: arguments)).thenAnswer((realInvocation) async => null);

      // Act
      await navigationService.replaceRoute(routeName, arguments: arguments);

      // Assert
      verify(navigatorState.pushReplacementNamed(routeName, arguments: arguments)).called(1);
    });

    test('routeAndPopUntil should call Navigator.pushNamedAndRemoveUntil with correct arguments', () async {
      // Arrange
      const newRouteName = '/new-route';
      final predicate = ModalRoute.withName('/test-route');
      final arguments = {'testArg': true};
      when(navigatorState.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments)).thenAnswer((realInvocation) async => null);

      // Act
      await navigationService.routeAndPopUntil(newRouteName, predicate, arguments: arguments);

      // Assert
      verify(navigatorState.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments)).called(1);
    });
  });
}
