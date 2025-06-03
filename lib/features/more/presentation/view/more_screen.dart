import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared/shared.dart';
import 'package:ui/ui.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../gen/assets.gen.dart';
import '../../../app/presentation/bloc/app_bloc.dart';
import '../../../login/data/model/user_model.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key, this.userModel});

  final UserModel? userModel;

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final NavigationService _navigationService = getIt<NavigationService>();
  late AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = context.read<AppBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              widget.userModel == null
                  ? _buildGuestHeader()
                  : Container(
                      width: double.infinity,
                      height: context.sh * 0.3,
                      decoration: BoxDecoration(
                        color: context.customColorStyle!.primary,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: AppImage(
                                path: Assets.images.engMhamdino.path,
                                width: 100,
                                height: 100,
                                boxFit: BoxFit.cover,
                                clipRRectBorderRadius: 50,
                              ),
                            ),
                            10.heightBox,
                            AppText("Eng MHamdino",
                                style: context.textTheme.displaySmall!
                                    .copyWith(color: Colors.white)),
                            5.heightBox,
                            AppText(
                              widget.userModel!.email ?? "No Email",
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ]),
                    ),
              50.heightBox,
              widget.userModel != null
                  ? InkWell(
                      onTap: () => _appBloc.add(AppEvent.onLogout()),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText("Logout",
                                style: context.textTheme.headlineSmall!
                                    .copyWith(
                                        color: context.customColorStyle?.red)),
                            8.widthBox,
                            Icon(
                              Icons.logout,
                              color: context.customColorStyle?.red,
                            ),
                          ]),
                    )
                  : const SizedBox(),
              50.heightBox
            ],
          ),
        ),
      ),
    );
  }

  _buildGuestHeader() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AppImage(
                path: Assets.images.logo.path,
                width: 107,
              ),
            ),
            20.widthBox,
            Expanded(
              child: AppButton(
                text: "Login",
                textStyle: context.textTheme.headlineSmall!
                    .copyWith(color: context.customColorStyle?.black),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: context.customColorStyle?.black, size: 16),
                type: ButtonType.secondary,
                onTap: () {
                  _navigationService.routeTo(AppRoutes.login);
                },
              ),
            )
          ]),
    ));
  }
}
