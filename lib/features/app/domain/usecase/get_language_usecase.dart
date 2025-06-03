import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class GetLanguageUseCase extends AppUseCase<LanguageEnum, NoParams> {
  GetLanguageUseCase(this._languageService);
  final LanguageService _languageService;
  @override
  LanguageEnum execute(NoParams params) {
    try {
      return _languageService.language;
    } catch (error) {
      return LanguageEnum.en;
    }
  }
}
