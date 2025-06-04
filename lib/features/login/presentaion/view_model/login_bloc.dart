import 'dart:async';
import 'package:eng_mhamdino_flutter_task/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import '../../../../core/router/app_routes.dart';
import '../../data/dto/login_dto.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.isFormValid({required bool isValid}) = _IsFormValidEvent;
  factory LoginEvent.loginPressed({required LoginDto loginDto}) =
      _LoginPressedEvent;
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isFormValid,
    String? errorMessage,
  }) = _LoginState;
}

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NavigationService _navigationService;
  final DialogService _dialogService;
  final LoginUseCase _loginUseCase;

  bool isValid = false;

  LoginBloc(this._navigationService, this._dialogService, this._loginUseCase)
      : super(LoginState()) {
    on<_IsFormValidEvent>(_onFormValidationChanged);
    on<_LoginPressedEvent>(_onLoginPressed);
  }

  FutureOr<void> _onFormValidationChanged(
      _IsFormValidEvent event, Emitter<LoginState> emit) async {
    isValid = event.isValid;
    emit(state.copyWith(isFormValid: isValid));
  }

  FutureOr<void> _onLoginPressed(
      _LoginPressedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    LoginDto loginDto = event.loginDto;
    await Future.delayed(
        const Duration(seconds: 2)); // Optional delay for UI smoothness

    final result = await _loginUseCase.execute(loginDto);
    await result.when(success: (userModel) async {
      _navigationService.replaceRoute(AppRoutes.home, arguments: userModel);
      emit(state.copyWith(isLoading: false));
    }, failed: (error) {
      _dialogService.showErrorMessage('Please check your credentials');
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    });
  }
}
