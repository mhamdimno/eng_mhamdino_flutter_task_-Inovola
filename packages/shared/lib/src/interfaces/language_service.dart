import 'package:shared/src/enum/language_enum.dart';

abstract class LanguageService {
  LanguageEnum get language;

  Future<void> saveString(LanguageEnum language);
}
