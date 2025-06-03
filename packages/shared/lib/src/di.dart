import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

@InjectableInit()
Future<void> sharedConfigureDependencies(GetIt getIt, String env) async {
  await getIt.init(environment: env);
}
