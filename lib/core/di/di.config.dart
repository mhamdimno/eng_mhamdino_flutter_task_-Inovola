// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_service/api_service.dart' as _i54;
import 'package:eng_mhamdino_flutter_task/core/di/register_module.dart'
    as _i1037;
import 'package:eng_mhamdino_flutter_task/core/local_service/local_service.dart'
    as _i432;
import 'package:eng_mhamdino_flutter_task/core/local_service/objectbox_service.dart'
    as _i646;
import 'package:eng_mhamdino_flutter_task/core/router/bottom_sheets/bottom_sheet.dart'
    as _i4;
import 'package:eng_mhamdino_flutter_task/features/app/data/repository/languge_repository_impl.dart'
    as _i453;
import 'package:eng_mhamdino_flutter_task/features/app/data/repository/last_version_repository.dart'
    as _i327;
import 'package:eng_mhamdino_flutter_task/features/app/domain/repository/language_repository.dart'
    as _i327;
import 'package:eng_mhamdino_flutter_task/features/app/domain/usecase/get_is_already_logged_in_usecase.dart'
    as _i685;
import 'package:eng_mhamdino_flutter_task/features/app/domain/usecase/get_language_usecase.dart'
    as _i277;
import 'package:eng_mhamdino_flutter_task/features/app/domain/usecase/get_username_usecase.dart'
    as _i669;
import 'package:eng_mhamdino_flutter_task/features/app/domain/usecase/save_language_usecase.dart'
    as _i861;
import 'package:eng_mhamdino_flutter_task/features/app/presentation/bloc/app_bloc.dart'
    as _i803;
import 'package:eng_mhamdino_flutter_task/features/crudExpense/add_expense/data/repository/add_expense_repository_impl.dart'
    as _i931;
import 'package:eng_mhamdino_flutter_task/features/crudExpense/add_expense/domain/repository/add_expense_repository.dart'
    as _i969;
import 'package:eng_mhamdino_flutter_task/features/crudExpense/add_expense/domain/usecase/post_add_expense_data_use_case.dart'
    as _i57;
import 'package:eng_mhamdino_flutter_task/features/crudExpense/add_expense/presentation/view_model/add_expense_cubit.dart'
    as _i480;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/data/repository/categories_repository_impl.dart'
    as _i616;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/repository/categories_repository.dart'
    as _i461;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/usecase/get_categories_data_use_case.dart'
    as _i710;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/usecase/post_category_data_use_case.dart'
    as _i46;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/presentation/view_model/categories_cubit.dart'
    as _i249;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/data/repository/currency_repository_impl.dart'
    as _i297;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/domain/repository/currency_repository.dart'
    as _i925;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/domain/usecase/get_currency_data_use_case.dart'
    as _i1054;
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/presentation/view_model/currency_cubit.dart'
    as _i34;
import 'package:eng_mhamdino_flutter_task/features/home/data/repository/home_repository_impl.dart'
    as _i830;
import 'package:eng_mhamdino_flutter_task/features/home/domain/repository/home_repository.dart'
    as _i376;
import 'package:eng_mhamdino_flutter_task/features/home/domain/usecase/get_home_data_use_case.dart'
    as _i824;
import 'package:eng_mhamdino_flutter_task/features/home/presentation/view_model/home_cubit.dart'
    as _i509;
import 'package:eng_mhamdino_flutter_task/features/login/data/repository/login_in_repository_impl.dart'
    as _i448;
import 'package:eng_mhamdino_flutter_task/features/login/domain/repository/authentication_repository.dart'
    as _i226;
import 'package:eng_mhamdino_flutter_task/features/login/domain/usecase/get_user_use_case.dart'
    as _i93;
import 'package:eng_mhamdino_flutter_task/features/login/domain/usecase/login_usecase.dart'
    as _i933;
import 'package:eng_mhamdino_flutter_task/features/login/domain/usecase/logout_usecase.dart'
    as _i85;
import 'package:eng_mhamdino_flutter_task/features/login/presentaion/view_model/login_bloc.dart'
    as _i309;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigator);
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i226.AuthenticationRepository>(
        () => _i448.LoginInRepositoryImpl());
    gh.factory<_i669.GetUsernameUseCase>(
        () => _i669.GetUsernameUseCase(gh<_i811.AppStartService>()));
    gh.factory<_i93.GetUserUseCase>(
        () => _i93.GetUserUseCase(gh<_i811.AppStartService>()));
    gh.factory<_i933.LoginUseCase>(() => _i933.LoginUseCase(
          gh<_i226.AuthenticationRepository>(),
          gh<_i811.AppStartService>(),
          gh<_i811.TokenService>(),
        ));
    gh.factory<_i309.LoginBloc>(() => _i309.LoginBloc(
          gh<_i811.NavigationService>(),
          gh<_i811.DialogService>(),
          gh<_i933.LoginUseCase>(),
        ));
    gh.lazySingletonAsync<_i432.LocalService>(
        () => _i646.ObjectBoxService.create());
    gh.factory<_i811.BottomSheetRouteGenerator>(
        () => _i4.BottomSheetsRouteGeneratorImpl());
    gh.factory<_i327.LanguageRepository>(
        () => _i453.LanguageRepositoryImpl(gh<_i54.ApiService>()));
    gh.factory<_i277.GetLanguageUseCase>(
        () => _i277.GetLanguageUseCase(gh<_i811.LanguageService>()));
    gh.factory<_i861.SaveLanguageUseCase>(
        () => _i861.SaveLanguageUseCase(gh<_i811.LanguageService>()));
    gh.factory<_i85.LogOutUseCase>(() => _i85.LogOutUseCase(
          gh<_i811.AuthService>(),
          gh<_i811.TokenService>(),
          gh<_i811.AppStartService>(),
        ));
    gh.factory<_i327.LastVersionRepository>(
        () => _i327.LastVersionRepositoryImpl(gh<_i54.ApiService>()));
    gh.factory<_i685.GetIsAlreadyLoggedInUseCase>(
        () => _i685.GetIsAlreadyLoggedInUseCase(gh<_i811.TokenService>()));
    gh.factoryAsync<_i376.HomeRepository>(() async => _i830.HomeRepositoryImpl(
        localService: await getAsync<_i432.LocalService>()));
    gh.factory<_i925.CurrencyRepository>(
        () => _i297.CurrencyInRepositoryImpl(gh<_i54.ApiService>()));
    gh.factory<_i1054.GetCurrencyDataUseCase>(
        () => _i1054.GetCurrencyDataUseCase(gh<_i925.CurrencyRepository>()));
    gh.factoryAsync<_i969.AddExpenseRepository>(() async =>
        _i931.AddExpenseInRepositoryImpl(await getAsync<_i432.LocalService>()));
    gh.factoryAsync<_i461.CategoriesRepository>(() async =>
        _i616.CategoriesInRepositoryImpl(await getAsync<_i432.LocalService>()));
    gh.factory<_i34.CurrencyCubit>(
        () => _i34.CurrencyCubit(gh<_i1054.GetCurrencyDataUseCase>()));
    gh.factoryAsync<_i710.GetCategoriesDataUseCase>(() async =>
        _i710.GetCategoriesDataUseCase(
            await getAsync<_i461.CategoriesRepository>()));
    gh.factoryAsync<_i46.PostCategoryDataUseCase>(() async =>
        _i46.PostCategoryDataUseCase(
            await getAsync<_i461.CategoriesRepository>()));
    gh.factoryAsync<_i824.GetHomeDataUseCase>(() async =>
        _i824.GetHomeDataUseCase(await getAsync<_i376.HomeRepository>()));
    gh.factoryAsync<_i57.PostAddExpenseDataUseCase>(() async =>
        _i57.PostAddExpenseDataUseCase(
            await getAsync<_i969.AddExpenseRepository>()));
    gh.factoryAsync<_i803.AppBloc>(() async => _i803.AppBloc(
          gh<_i685.GetIsAlreadyLoggedInUseCase>(),
          gh<_i811.NavigationService>(),
          gh<_i811.AuthService>(),
          gh<_i277.GetLanguageUseCase>(),
          gh<_i861.SaveLanguageUseCase>(),
          await getAsync<_i432.LocalService>(),
          gh<_i811.DialogService>(),
          gh<_i85.LogOutUseCase>(),
          gh<_i93.GetUserUseCase>(),
        ));
    gh.factoryAsync<_i249.CategoriesCubit>(() async => _i249.CategoriesCubit(
          await getAsync<_i710.GetCategoriesDataUseCase>(),
          await getAsync<_i46.PostCategoryDataUseCase>(),
        ));
    gh.factoryAsync<_i509.HomeCubit>(() async =>
        _i509.HomeCubit(await getAsync<_i824.GetHomeDataUseCase>()));
    gh.factoryAsync<_i480.AddExpenseCubit>(() async => _i480.AddExpenseCubit(
        await getAsync<_i57.PostAddExpenseDataUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i1037.RegisterModule {}
