import 'package:api_service/api_service.dart';
import 'package:dialog_services/dialog_services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  await getIt.reset();
  await sharedConfigureDependencies(getIt, env);
  dialogServicesConfigureDependencies(getIt, env);
  getIt.init(environment: env);
  apiServiceConfigureDependencies(getIt, env);
}
