import 'package:injectable/injectable.dart';
import '../../shared.dart';

@Injectable(as: AppStartService)
class AppStartImpl extends AppStartService {
  final SharedPreferencesService _sharedPreferencesService;
  static const _user= '_user';
  AppStartImpl(this._sharedPreferencesService);

  @override
  Future<void> setUser(String user)async {
    await _sharedPreferencesService.saveString(_user, user);
  }

  @override
  String? get user => _sharedPreferencesService.getString(_user);

  @override
  Future<void> removeUser() async{
    await _sharedPreferencesService.removeValue(_user);
  }
}
