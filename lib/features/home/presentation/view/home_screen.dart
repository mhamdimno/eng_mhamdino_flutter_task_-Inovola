import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/presentation/widgets/filter_widget.dart';
import 'package:eng_mhamdino_flutter_task/features/login/data/model/user_model.dart';
import 'package:eng_mhamdino_flutter_task/widgets/app_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eng_mhamdino_flutter_task/core/di/di.dart';

import 'package:eng_mhamdino_flutter_task/features/home/presentation/view_model/home_cubit.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared/shared.dart';

import 'package:ui/ui.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/model/expense_model.dart';
import '../widgets/expended_item_widget.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? userModel;
  const HomeScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit; // Make it nullable initially
  bool _isLoading = true;
  final NavigationService _navigationService = getIt<NavigationService>();

  @override
  void initState() {
    super.initState();
    _initializeCubit();
  }

  Future<void> _initializeCubit() async {
    _homeCubit = await getIt.getAsync<HomeCubit>();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox();

    return BlocProvider<HomeCubit>(
      create: (context) => _homeCubit..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.errorMessage != null
              ? Center(
                  child: AppText(state.errorMessage!)
                      .setAnimation(AnimateType.bounceInDown),
                )
              : Scaffold(
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          _buildHeader(context),
                          Expanded(
                            child: AppPadding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 100),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        // Using textTheme
                                        'Recent Expenses',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                      ),
                                      // TextButton(
                                      //   onPressed: () {
                                      //     // Handle see all
                                      //     _navigationService.routeTo(
                                      //       AppRoutes.viewAllExpenses,
                                      //     );
                                      //   },
                                      //   child: AppText(
                                      //     // Using textTheme
                                      //     'see all',
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .labelMedium
                                      //         ?.copyWith(
                                      //           color: const Color(0xFF4A68FF),
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  _buildRecentExpensesList(state),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          top: 150,
                          left: 20,
                          right: 20,
                          child: _buildBalanceCard(context, state.homeModel)),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      height: context.sh * 0.3684848485,
      decoration: BoxDecoration(
        color: context.customColorStyle?.primary,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppImage(
                    path: Assets.images.engMhamdino.path,
                    width: 50,
                    height: 50,
                    boxFit: BoxFit.cover,
                    clipRRectBorderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          // Using textTheme
                          'Good Morning',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white70,
                                  )),
                      AppText(
                        // Using textTheme
                        widget.userModel?.email ?? 'User',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              FilterableListScreen(onSelectItem: (onSelectItem) {
                _homeCubit.resetPagination();

                _homeCubit.onFilterChanged(
                  onSelectItem,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context, HomeModel? homeModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF4A68FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                // Using textTheme
                'Total Balance',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
              ),
              8.widthBox,
              const Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.white70,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 5),
          AppText(
            // Using textTheme
            '\$ ${homeModel?.totalBalance.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 112, 137, 245),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      AppText(
                        // Using textTheme
                        ' Income',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                  AppText(
                    // Using textTheme
                    '\$ ${homeModel?.totalIncome.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 112, 137, 245),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      AppText(
                        // Using textTheme
                        ' Expenses',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                      ),
                    ],
                  ),
                  AppText(
                    // Using textTheme
                    '\$ ${homeModel?.totalExpenses.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).setAnimation(AnimateType.moveY);
  }

  Widget _buildRecentExpensesList(HomeState state) {
    return (state.homeModel?.expensedList.length ?? 0) < 1
        ? const SizedBox()
        : Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.homeModel?.expensedList.isEmpty ?? true
                    ? Center(
                        child: AppText(
                          'No recent expenses',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : AppList(
                        onLoadMore: () {
                          _homeCubit.getHomeData();
                        },
                        itemCount: state.homeModel!.expensedList.length +
                            (state.hasReachedMax ? 0 : 1),
                        itemBuilder: (context, index) {
                          if (index >= state.homeModel!.expensedList.length) {
                            return const SizedBox
                                .shrink(); // No more data, hide indicator
                          }
                          final expense = state.homeModel?.expensedList[index];
                          return ExpensedItem(
                            expense: expense,
                          );
                        }),
          );
  }
}
