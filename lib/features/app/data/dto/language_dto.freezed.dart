// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageDto {
  String get preferredLanguage => throw _privateConstructorUsedError;

  /// Serializes this LanguageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LanguageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageDtoCopyWith<LanguageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageDtoCopyWith<$Res> {
  factory $LanguageDtoCopyWith(
          LanguageDto value, $Res Function(LanguageDto) then) =
      _$LanguageDtoCopyWithImpl<$Res, LanguageDto>;
  @useResult
  $Res call({String preferredLanguage});
}

/// @nodoc
class _$LanguageDtoCopyWithImpl<$Res, $Val extends LanguageDto>
    implements $LanguageDtoCopyWith<$Res> {
  _$LanguageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LanguageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredLanguage = null,
  }) {
    return _then(_value.copyWith(
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageDtoImplCopyWith<$Res>
    implements $LanguageDtoCopyWith<$Res> {
  factory _$$LanguageDtoImplCopyWith(
          _$LanguageDtoImpl value, $Res Function(_$LanguageDtoImpl) then) =
      __$$LanguageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String preferredLanguage});
}

/// @nodoc
class __$$LanguageDtoImplCopyWithImpl<$Res>
    extends _$LanguageDtoCopyWithImpl<$Res, _$LanguageDtoImpl>
    implements _$$LanguageDtoImplCopyWith<$Res> {
  __$$LanguageDtoImplCopyWithImpl(
      _$LanguageDtoImpl _value, $Res Function(_$LanguageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LanguageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredLanguage = null,
  }) {
    return _then(_$LanguageDtoImpl(
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$LanguageDtoImpl implements _LanguageDto {
  _$LanguageDtoImpl({required this.preferredLanguage});

  @override
  final String preferredLanguage;

  @override
  String toString() {
    return 'LanguageDto(preferredLanguage: $preferredLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageDtoImpl &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, preferredLanguage);

  /// Create a copy of LanguageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageDtoImplCopyWith<_$LanguageDtoImpl> get copyWith =>
      __$$LanguageDtoImplCopyWithImpl<_$LanguageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageDtoImplToJson(
      this,
    );
  }
}

abstract class _LanguageDto implements LanguageDto {
  factory _LanguageDto({required final String preferredLanguage}) =
      _$LanguageDtoImpl;

  @override
  String get preferredLanguage;

  /// Create a copy of LanguageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageDtoImplCopyWith<_$LanguageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
