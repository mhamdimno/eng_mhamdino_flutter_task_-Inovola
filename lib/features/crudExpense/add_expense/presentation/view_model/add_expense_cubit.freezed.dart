// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_expense_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddExpenseState {
  bool get isLoading => throw _privateConstructorUsedError;
  CurrencyModel? get selectedCurrency => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  /// Create a copy of AddExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddExpenseStateCopyWith<AddExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddExpenseStateCopyWith<$Res> {
  factory $AddExpenseStateCopyWith(
          AddExpenseState value, $Res Function(AddExpenseState) then) =
      _$AddExpenseStateCopyWithImpl<$Res, AddExpenseState>;
  @useResult
  $Res call(
      {bool isLoading,
      CurrencyModel? selectedCurrency,
      String? errorMessage,
      bool isFormValid});
}

/// @nodoc
class _$AddExpenseStateCopyWithImpl<$Res, $Val extends AddExpenseState>
    implements $AddExpenseStateCopyWith<$Res> {
  _$AddExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedCurrency = freezed,
    Object? errorMessage = freezed,
    Object? isFormValid = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddExpenseStateImplCopyWith<$Res>
    implements $AddExpenseStateCopyWith<$Res> {
  factory _$$AddExpenseStateImplCopyWith(_$AddExpenseStateImpl value,
          $Res Function(_$AddExpenseStateImpl) then) =
      __$$AddExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      CurrencyModel? selectedCurrency,
      String? errorMessage,
      bool isFormValid});
}

/// @nodoc
class __$$AddExpenseStateImplCopyWithImpl<$Res>
    extends _$AddExpenseStateCopyWithImpl<$Res, _$AddExpenseStateImpl>
    implements _$$AddExpenseStateImplCopyWith<$Res> {
  __$$AddExpenseStateImplCopyWithImpl(
      _$AddExpenseStateImpl _value, $Res Function(_$AddExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedCurrency = freezed,
    Object? errorMessage = freezed,
    Object? isFormValid = null,
  }) {
    return _then(_$AddExpenseStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddExpenseStateImpl implements _AddExpenseState {
  _$AddExpenseStateImpl(
      {this.isLoading = false,
      this.selectedCurrency,
      this.errorMessage,
      this.isFormValid = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CurrencyModel? selectedCurrency;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isFormValid;

  @override
  String toString() {
    return 'AddExpenseState(isLoading: $isLoading, selectedCurrency: $selectedCurrency, errorMessage: $errorMessage, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddExpenseStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, selectedCurrency, errorMessage, isFormValid);

  /// Create a copy of AddExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddExpenseStateImplCopyWith<_$AddExpenseStateImpl> get copyWith =>
      __$$AddExpenseStateImplCopyWithImpl<_$AddExpenseStateImpl>(
          this, _$identity);
}

abstract class _AddExpenseState implements AddExpenseState {
  factory _AddExpenseState(
      {final bool isLoading,
      final CurrencyModel? selectedCurrency,
      final String? errorMessage,
      final bool isFormValid}) = _$AddExpenseStateImpl;

  @override
  bool get isLoading;
  @override
  CurrencyModel? get selectedCurrency;
  @override
  String? get errorMessage;
  @override
  bool get isFormValid;

  /// Create a copy of AddExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddExpenseStateImplCopyWith<_$AddExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
