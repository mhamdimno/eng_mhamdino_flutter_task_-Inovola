import 'package:injectable/injectable.dart';
import '../dto/login_dto.dart';
import '../model/user_model.dart';
import '../../domain/repository/authentication_repository.dart';

@Injectable(as: AuthenticationRepository)
class LoginInRepositoryImpl extends AuthenticationRepository {
  LoginInRepositoryImpl();

  @override
  Future<UserModel> login({required LoginDto loginDto}) {
    return Future<UserModel>.value(UserModel(
      email: loginDto.email,
      name: "ENG Mohamed Hamdino",
    ));
  }
}
