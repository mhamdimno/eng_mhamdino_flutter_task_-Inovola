import 'package:injectable/injectable.dart';

import '../../shared.dart';

@Injectable(as: LanguageService)
class LanguageServiceImpl extends LanguageService {
  static const _languageKey = 'language_key';
  LanguageServiceImpl(this._sharedPreferencesService);
  final SharedPreferencesService _sharedPreferencesService;

  @override
  LanguageEnum get language => _sharedPreferencesService.getString(_languageKey, defaultValue: LanguageEnum.en.code)!.language;

  @override
  Future<void> saveString(LanguageEnum language) async {
    _sharedPreferencesService.saveString(_languageKey, language.code);
  }
}
