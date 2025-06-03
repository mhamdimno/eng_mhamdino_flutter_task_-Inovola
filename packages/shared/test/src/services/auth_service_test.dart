import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/services/auth_service.dart';

void main() {
  group('Auth Service Tests', () {
    late AuthService authService;

    setUp(() {
      authService = AuthServiceImpl();
    });

    // Test case for AuthServiceImpl's updateStatus method
    test('updateStatus should add status to the stream', () async {
      // Arrange
      final expected = [
        AuthStatus.expired,
        AuthStatus.loggedIn,
        AuthStatus.loggedOut,
      ];

      expectLater(authService.isLoggedIn, emitsInOrder(expected));

      for (var status in expected) {
        authService.updateStatus(status);
      }
    });
  });
}
