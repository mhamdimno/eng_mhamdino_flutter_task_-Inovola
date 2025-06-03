// import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
// import 'package:eng_mhamdino_flutter_task/features/login/data/model/user_model.dart';
// import 'package:eng_mhamdino_flutter_task/widgets/app_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:eng_mhamdino_flutter_task/core/di/di.dart';

// import 'package:eng_mhamdino_flutter_task/features/home/presentation/view_model/home_cubit.dart';
// import 'package:line_icons/line_icon.dart';
// import 'package:line_icons/line_icons.dart';

// import 'package:ui/ui.dart';

// import '../../../../gen/assets.gen.dart';
// import '../../data/model/expense_model.dart';
// import '../widgets/expended_item_widget.dart';

// class ExpansesScreen extends StatefulWidget {
//   const ExpansesScreen({
//     super.key,
//   });

//   @override
//   State<ExpansesScreen> createState() => _ExpansesScreenState();
// }

// class _ExpansesScreenState extends State<ExpansesScreen> {
//   late HomeCubit _homeCubit; // Make it nullable initially
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCubit();
//   }

//   Future<void> _initializeCubit() async {
//     _homeCubit = await getIt.getAsync<HomeCubit>();
//     setState(() => _isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) return const SizedBox();

//     return BlocProvider<HomeCubit>(
//       create: (context) => _homeCubit..getHomeData(),
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           //err if (state.isLoading || state.homeModel == null)
//           //   return const AppLoading();
//           return Scaffold(
//             appBar: AppBar(
//               title: const AppText('Expanses'),
//               leading: IconButton(
//                 icon: const LineIcon(LineIcons.arrowLeft),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//             ),
//             body: AppList(
//                 itemCount: state.homeModel?.expensedList.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final expense = state.homeModel?.expensedList[index];
//                   return ExpensedItem(expense: expense);
//                 }),
//           );
//         },
//       ),
//     );
//   }
// }
