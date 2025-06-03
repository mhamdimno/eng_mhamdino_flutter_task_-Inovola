import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl extends AuthService {
  final _isLoggedIn = StreamController<AuthStatus>.broadcast();

  @override
  Stream<AuthStatus> get isLoggedIn => _isLoggedIn.stream;

  @override
  void updateStatus(AuthStatus status) {
    _isLoggedIn.add(status);
  }
}
