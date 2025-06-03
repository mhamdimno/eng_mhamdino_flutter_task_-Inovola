abstract class TokenService {
  String? get getAuthToken;

  Future<void> setAuthAndRefreshToken(String token,String refreshToken);

  Future<bool> clearAuthAndRefreshToken();

  bool isAlreadyLoggedIn();
}
