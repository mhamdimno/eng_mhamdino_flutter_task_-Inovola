abstract class AuthService {
  Stream<AuthStatus> get isLoggedIn;
  void updateStatus(AuthStatus status);
}

enum AuthStatus { loggedIn, loggedOut, expired }
