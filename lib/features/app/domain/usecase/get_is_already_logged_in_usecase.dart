// ignore_for_file: always_specify_types

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class GetIsAlreadyLoggedInUseCase extends AppUseCase<Future<Result<bool>>, NoParams> {
  final TokenService _tokenService;
  GetIsAlreadyLoggedInUseCase(this._tokenService);

  @override
  Future<Result<bool>> execute(NoParams params)async {
    try {
      final bool isAlreadyLoggedIn = _tokenService.isAlreadyLoggedIn();
      return Result.success(data: isAlreadyLoggedIn);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
