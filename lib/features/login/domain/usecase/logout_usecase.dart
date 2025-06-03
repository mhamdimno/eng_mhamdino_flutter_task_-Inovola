import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class LogOutUseCase extends AppAsyncUseCase<Result<NoResult>, NoParams> {
  LogOutUseCase(this._authService, this._tokenService, this._appStartService);
  final TokenService _tokenService;
  final AuthService _authService;
  final AppStartService _appStartService;


  @override
  Future<Result<NoResult>> execute(NoParams params) async {
    try {
      await _tokenService.clearAuthAndRefreshToken();
      await _appStartService.removeUser();
      _authService.updateStatus(AuthStatus.loggedOut);
      return const Result.success(data: NoResult());
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
