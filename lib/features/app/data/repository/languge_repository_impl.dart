import 'package:api_service/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_path.dart';
import '../../domain/repository/language_repository.dart';
import '../dto/language_dto.dart';

@Injectable(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  LanguageRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<void> putLanguage({required LanguageDto dto}) {
    return _apiService.put(
      ApiPath.language,
      fromJson: (_) {},
      data: dto.toJson(),
    );
  }
}
