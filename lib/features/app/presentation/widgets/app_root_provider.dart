// ignore_for_file: always_specify_types, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import '../../../../core/di/di.dart';
import '../bloc/app_bloc.dart';

class AppRootProvider extends StatefulWidget {
  final Widget child;

  const AppRootProvider({required this.child, super.key});

  @override
  State<AppRootProvider> createState() => _AppRootProviderState();
}

class _AppRootProviderState extends State<AppRootProvider> {
  late final AppBloc _appBloc;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCubit();
  }

  Future<void> _initializeCubit() async {
    _appBloc = await getIt.getAsync<AppBloc>();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox();
    }
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider(
            create: (BuildContext context) => _appBloc
              ..add(AppEvent.checkLastVersion())
              ..add(AppEvent.onGetUserData())),
      ],
      child: widget.child,
    );
  }
}
