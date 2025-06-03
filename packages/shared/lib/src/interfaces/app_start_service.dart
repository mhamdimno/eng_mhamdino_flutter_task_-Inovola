abstract class AppStartService {
  String? get user;

  Future<void> setUser(String user);
  Future<void> removeUser();

}
