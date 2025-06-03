import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../data/model/user_model.dart';

@injectable
class GetUserUseCase extends AppAsyncUseCase<Result<UserModel?>, NoParams> {
  final AppStartService _appStartService;

  GetUserUseCase(this._appStartService);

  @override
  Future<Result<UserModel?>> execute(NoParams params) async {
    try {
      Future.delayed(const Duration(seconds: 1));
      final userJson = _appStartService.user;
      if (userJson == null) {
        return const Result.success(data: null);
      }
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userMap);
      return Result.success(data: userModel);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
