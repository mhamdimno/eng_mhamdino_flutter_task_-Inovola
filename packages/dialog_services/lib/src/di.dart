import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

@InjectableInit()
void dialogServicesConfigureDependencies(GetIt getIt, String env) {
  getIt.init(environment: env);
}
