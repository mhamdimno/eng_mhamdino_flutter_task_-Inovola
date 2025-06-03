import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../app/index.dart';
import '../local_service/local_service.dart';
import '../local_service/objectbox_service.dart';

@module
abstract class RegisterModule {
  @Named('BaseUrl')
  String get baseUrl => AppManager.instance.env.baseUrl;

  @lazySingleton
  GlobalKey<NavigatorState> get navigator => GlobalKey<NavigatorState>();

  // @Injectable()
  // FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
}
