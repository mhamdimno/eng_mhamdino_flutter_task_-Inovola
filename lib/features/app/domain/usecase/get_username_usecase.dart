import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../../login/data/model/user_model.dart';
import 'package:shared/shared.dart';

@injectable
class GetUsernameUseCase extends AppAsyncUseCase<Result<UserModel?>, NoParams> {
  final AppStartService _appStartService;

  GetUsernameUseCase(this._appStartService);

  @override
  Future<Result<UserModel?>> execute(NoParams params) async {
    try {
      String user = _appStartService.user ?? '';
      UserModel? userModel;
      if (user.isNotEmpty) {
        Map<String, dynamic> jsonData = jsonDecode(user);
        userModel = UserModel.fromJson(jsonData);
      }
      return Result.success(data: userModel);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
