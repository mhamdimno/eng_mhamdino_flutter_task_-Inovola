import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@Injectable(as: TokenService)
class TokenServiceImpl extends TokenService {
  static const _accessTokenKey = 'access_token_key';
  static const _userName = '_userName';

  final SharedPreferencesService _sharedPreferencesService;

  TokenServiceImpl(this._sharedPreferencesService);

  @override
  String? get getAuthToken => _sharedPreferencesService.getString(_accessTokenKey);

  @override
  Future<void> setAuthAndRefreshToken(String token,String refreshToken) async {
    await _sharedPreferencesService.saveString(_accessTokenKey, token);
  }

  @override
  Future<bool> clearAuthAndRefreshToken() async {
    return await _sharedPreferencesService.removeValue(_accessTokenKey);
  }

  @override
  bool isAlreadyLoggedIn() => getAuthToken != null;

  @override
  Future<void> setUserName(String userName) async{
    await _sharedPreferencesService.saveString(_userName, userName);
  }
}
