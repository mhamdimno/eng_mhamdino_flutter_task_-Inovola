// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dialog_services/src/bottom_sheet/bottom_sheet_service_impl.dart'
    as _i4;
import 'package:dialog_services/src/dialog_service/dialog_service_impl.dart'
    as _i5;
import 'package:dialog_services/src/snackbar_service/snackbar_service.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared/shared.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.BottomSheetService>(
        () => _i4.BottomSheetServiceImpl(gh<_i3.NavigationService>()));
    gh.lazySingleton<_i3.DialogService>(
        () => _i5.DialogServiceImpl(gh<_i3.NavigationService>()));
    gh.lazySingleton<_i3.SnackBarService>(
        () => _i6.SnackBarServiceImpl(gh<_i3.NavigationService>()));
    return this;
  }
}
