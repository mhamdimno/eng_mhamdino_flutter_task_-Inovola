import '../../data/dto/language_dto.dart';

abstract class LanguageRepository {
  Future<void> putLanguage({required LanguageDto dto});
}
