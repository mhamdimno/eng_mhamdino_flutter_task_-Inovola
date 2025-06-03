import '../../data/dto/login_dto.dart';
import '../../data/model/user_model.dart';

abstract class AuthenticationRepository {
  Future<UserModel> login({required LoginDto loginDto});
}
