import 'package:eng_mhamdino_flutter_task/core/router/app_routes.dart';
import 'package:eng_mhamdino_flutter_task/features/login/data/model/user_model.dart';
import 'package:eng_mhamdino_flutter_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eng_mhamdino_flutter_task/features/app/presentation/bloc/app_bloc.dart';
import 'package:eng_mhamdino_flutter_task/features/home/presentation/view/home_screen.dart';

import 'package:line_icons/line_icon.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';
import '../../../../core/di/di.dart';
import '../../../../core/local_service/objectbox_service.dart';
import '../../../more/presentation/view/more_screen.dart';
import '../view_model/home_cubit.dart';

class MainHomeScreen extends StatefulWidget {
  final UserModel? userModel;
  const MainHomeScreen({super.key, this.userModel});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  final NavigationService _navigationService = getIt<NavigationService>();
  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final screens = _userScreens();

        return Scaffold(
          body: screens[_selectedIndex],
          bottomNavigationBar: _buildBottomNavigationBar(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _navigationService
                  .routeTo(
                AppRoutes.addExpense,
              )
                  .then((value) {
                if (value == true) {
                  _navigationService.replaceRoute(AppRoutes.home);
                }
              });
            },
            backgroundColor: const Color(0xFF4A68FF),
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
        );
      },
    );
  }

  List<Widget> _userScreens() => [
        HomeScreen(
          userModel: widget.userModel,
        ),
        MoreScreen(userModel: widget.userModel),
      ];

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    final items = _userNavItems(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: _getTextStyle(context, isSelected: true),
      unselectedLabelStyle: _getTextStyle(context, isSelected: false),
      items: items,
    );
  }

  List<BottomNavigationBarItem> _userNavItems(BuildContext context) => [
        _buildNavItem(
          context,
          0,
          AppImage(
              path: Assets.icons.home.path,
              width: 33,
              height: 33,
              boxFit: BoxFit.fill),
        ),
        _buildNavItem(
          context,
          0,
          AppImage(
              path: Assets.icons.person.path,
              width: 33,
              height: 33,
              boxFit: BoxFit.fill),
        ),
      ];

  BottomNavigationBarItem _buildNavItem(
    BuildContext context,
    int index,
    Widget icon,
  ) {
    return BottomNavigationBarItem(icon: icon, label: "");
  }

  TextStyle _getTextStyle(BuildContext context, {required bool isSelected}) {
    return context.textTheme.bodyMedium!.copyWith(
      color: isSelected
          ? context.customColorStyle!.black
          : context.customColorStyle!.grey,
    );
  }
}
