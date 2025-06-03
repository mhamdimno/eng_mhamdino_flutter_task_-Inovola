import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@injectable
class SaveLanguageUseCase extends AppAsyncUseCase<void, LanguageEnum> {
  SaveLanguageUseCase(this._languageService);
  final LanguageService _languageService;

  @override
  Future<void> execute(LanguageEnum params) async {
    try {
      // if (_tokenService.isAlreadyLoggedIn()) {
      //   _languageRepository.putLanguage(dto: LanguageDto(preferredLanguage: params.toString()));
      // }
      await _languageService.saveString(params);
    } catch (error) {
      return;
    }
  }
}
