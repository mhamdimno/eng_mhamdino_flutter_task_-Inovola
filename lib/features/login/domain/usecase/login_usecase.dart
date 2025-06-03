import 'dart:convert';

import 'package:eng_mhamdino_flutter_task/features/login/data/model/user_model.dart';
import 'package:injectable/injectable.dart';
import '../../data/dto/login_dto.dart';
import 'package:shared/shared.dart';
import '../repository/authentication_repository.dart';

@injectable
class LoginUseCase extends AppAsyncUseCase<Result<UserModel>, LoginDto> {
  final AuthenticationRepository loginRepository;
  final AppStartService _appStartService;
  final TokenService _tokenService;

  LoginUseCase(this.loginRepository, this._appStartService, this._tokenService);

  @override
  Future<Result<UserModel>> execute(LoginDto params) async {
    try {
      final userModel = await loginRepository.login(loginDto: params);
      String userJson = jsonEncode(userModel.toJson());
      await _appStartService.setUser(userJson);
      await _tokenService.setAuthAndRefreshToken(userModel.token ?? "", '');
      return Result.success(data: userModel);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
