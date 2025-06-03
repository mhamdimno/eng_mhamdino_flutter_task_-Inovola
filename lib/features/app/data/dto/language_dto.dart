import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_dto.freezed.dart';
part 'language_dto.g.dart';

@Freezed(toJson: true)
class LanguageDto with _$LanguageDto {
  factory LanguageDto({
    required String preferredLanguage,
  }) = _LanguageDto;
}
