import 'dart:async';
import 'package:eng_mhamdino_flutter_task/core/local_service/local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';
import '../../../../core/local_service/objectbox_service.dart';
import '../../../../core/local_service/seeder_data.dart';
import '../../../../core/router/index.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../dropdowns/categories/data/model/cateogory_model.dart';
import '../../../login/data/model/user_model.dart';
import '../../../login/domain/usecase/get_user_use_case.dart';
import '../../../login/domain/usecase/logout_usecase.dart';
import '../../data/dto/language_dto.dart';
import '../../domain/usecase/get_is_already_logged_in_usecase.dart';
import '../../domain/usecase/get_language_usecase.dart';
import '../../domain/usecase/save_language_usecase.dart';

part 'app_bloc.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  factory AppEvent.preload() = _PreloadAppEvent;

  factory AppEvent.setupOfflineDataBase() = _SetupOfflineDatabaseEvent;

  factory AppEvent.checkLastVersion() = _CheckLastVersionEvent;

  factory AppEvent.onLanguageSelected({required LanguageEnum languageEnum}) =
      _OnLanguageSelectedAppEvent;

  factory AppEvent.onToggleLanguage() = _OnToggleLanguageAppEvent;

  factory AppEvent.onGetUserData() = _OnGetUserDataAppEvent;

  factory AppEvent.onLogout() = _OnLogoutAppEvent;
}

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(false) bool isLoading,
    ThemeData? themeData,
    UserModel? userModel,
    @Default(LanguageEnum.en) LanguageEnum languageEnum,
  }) = _CurrentAppState;
}

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final GetIsAlreadyLoggedInUseCase _isAlreadyLoggedInUseCase;
  final GetLanguageUseCase _languageUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;
  final NavigationService _navigationService;
  final LocalService _localService;
  final DialogService _dialogService;
  final AuthService _authService;
  final LogOutUseCase _logOutUseCase;
  final GetUserUseCase _getUserUseCase;
  late StreamSubscription<AuthStatus> _authStateStreamSubscription;
  late LanguageDto dto;

  AppBloc(
    this._isAlreadyLoggedInUseCase,
    this._navigationService,
    this._authService,
    this._languageUseCase,
    this._saveLanguageUseCase,
    this._localService,
    this._dialogService,
    this._logOutUseCase,
    this._getUserUseCase,
  ) : super(AppState(themeData: AppThemes.theme)) {
    on<_PreloadAppEvent>(_onPreload);
    on<_CheckLastVersionEvent>(_onCheckLastVersion);
    on<_OnLanguageSelectedAppEvent>(_onLanguageSelected);
    on<_OnToggleLanguageAppEvent>(_onToggleLanguage);
    on<_OnGetUserDataAppEvent>(_getUserData);
    on<_OnLogoutAppEvent>(_onLogout);
    _authStateStreamSubscription =
        _authService.isLoggedIn.listen(_loginStateChanges);
  }

  FutureOr<void> _onPreload(
      _PreloadAppEvent event, Emitter<AppState> emit) async {
    SeederDataManager.seedCategories(_localService);
    final LanguageEnum languageEnum =
        _languageUseCase.execute(const NoParams());
    emit(AppState(themeData: AppThemes.theme, languageEnum: languageEnum));
    final Result<bool> result =
        await _isAlreadyLoggedInUseCase.execute(const NoParams());
    await Future.delayed(const Duration(seconds: 0));
    result.when(
      success: (bool isAuthenticated) {
        // if (isAuthenticated) {
        _navigationService.replaceRoute(
          AppRoutes.home,
        );
        // } else {
        //   _navigationService.replaceRoute(AppRoutes.login);
        // }
      },
      failed: (FailureResult e) {
        _dialogService.showErrorMessage(e.debugMessage);
      },
    );
  }

  void _loginStateChanges(AuthStatus loggedIn) {
    if (loggedIn == AuthStatus.expired) {
    } else if (loggedIn == AuthStatus.loggedOut) {
      _navigationService.routeAndPopUntil(AppRoutes.login, (_) => false);
    }
  }

  Future<void> _getUserData(
      _OnGetUserDataAppEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUserUseCase.execute(const NoParams());
    result.when(success: (model) {
      emit(state.copyWith(userModel: model));
    }, failed: (e) {
      emit(state.copyWith(isLoading: false));
    });
  }

  FutureOr<void> _onLanguageSelected(
      _OnLanguageSelectedAppEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(languageEnum: event.languageEnum));
    await _saveLanguageUseCase.execute(event.languageEnum);
  }

  FutureOr<void> _onToggleLanguage(
      _OnToggleLanguageAppEvent event, Emitter<AppState> emit) async {
    final LanguageEnum language = state.languageEnum == LanguageEnum.en
        ? LanguageEnum.ar
        : LanguageEnum.en;
    emit(state.copyWith(languageEnum: language));
    await _saveLanguageUseCase.execute(language);
  }

  @override
  Future<void> close() {
    _authStateStreamSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onLogout(event, Emitter<AppState> emit) async {
    final confirmDialog = DialogUtils().getConfirmDialog(
      title: "Logout",
      description: "Are you sure you want to logout?",
      primaryText: "Yes, Logout",
      onPrimaryTapped: () async {
        emit(state.copyWith(isLoading: true));
        final Result<NoResult> result =
            await _logOutUseCase.execute(const NoParams());
        result.when(
          success: (_) async {
            emit(state.copyWith(isLoading: false));
            await _navigationService.replaceRoute(AppRoutes.login);
          },
          failed: (FailureResult e) async {
            emit(state.copyWith(isLoading: false));
            await _dialogService.showErrorMessage(e.debugMessage);
          },
        );
      },
    );
    await _dialogService.showAppDialog(confirmDialog);
  }

  FutureOr<void> _onCheckLastVersion(
      _CheckLastVersionEvent event, Emitter<AppState> emit) async {
    add(AppEvent.preload());

    // final result = await _getLastVersionUseCase.execute(const NoParams());
    // result.when(success: (isLastVersion) {
    //   if (isLastVersion) {
    //     add(AppEvent.preload());
    //   } else {
    //     _navigationService.replaceRoute(AppRoutes.lastVersion);
    //   }
    // }, failed: (error) {
    //   _dialogService.showErrorMessage('Please Check Your Internet Connection');
    //   emit(state.copyWith(isLoading: false));
    // });
  }
}
