import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/index.dart';
import '../../../../l10n/app_localizations.g.dart';
import '../bloc/app_bloc.dart';
import '../widgets/app_root_provider.dart';

class AppScreen extends StatelessWidget {
  AppScreen({super.key});
  final GlobalKey<NavigatorState> _navigatorKey =
      getIt<GlobalKey<NavigatorState>>();
  @override
  Widget build(BuildContext context) {
    return AppRootProvider(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: AppRoutesGenerator.generateRoute,
            locale: Locale(state.languageEnum.code),
            navigatorKey: _navigatorKey,
            theme: state.themeData,
          );
        },
      ),
    );
  }
}
