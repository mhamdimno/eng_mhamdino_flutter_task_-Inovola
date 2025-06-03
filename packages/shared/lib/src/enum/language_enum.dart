import 'package:json_annotation/json_annotation.dart';

enum LanguageEnum {
  @JsonValue('en')
  en,
  @JsonValue('ar')
  ar,
}

extension LanguageEnumHelper on LanguageEnum? {
  String get code {
    switch (this) {
      case LanguageEnum.en:
        return 'en';
      case LanguageEnum.ar:
        return 'ar';
      default:
        return 'en';
    }
  }
}

extension LanguageString on String? {
  LanguageEnum get language {
    switch (this) {
      case 'ar':
        return LanguageEnum.ar;
      default:
        return LanguageEnum.en;
    }
  }
}
