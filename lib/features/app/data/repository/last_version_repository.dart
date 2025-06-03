import 'package:api_service/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_path.dart';
import '../model/last_version_model.dart';

abstract class LastVersionRepository {
  Future<LastVersionModel> getLastVersion();
}

@Injectable(as: LastVersionRepository)
class LastVersionRepositoryImpl extends LastVersionRepository {

  final ApiService _apiService;

  LastVersionRepositoryImpl(this._apiService);

  @override
  Future<LastVersionModel> getLastVersion() async{
    return await _apiService.get<LastVersionModel>(
      ApiPath.appVersion,
      fromJson: LastVersionModel.fromJson,
    );
  }

}
