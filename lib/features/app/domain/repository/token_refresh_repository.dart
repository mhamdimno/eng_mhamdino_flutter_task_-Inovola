import '../../data/model/token_refresh_model.dart';

abstract class TokenRefreshRepository {
  Future<TokenRefreshModel> refreshToken();
}
