// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ui/src/extensions/context_extensions.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? title;
//   final Widget? components;
//   final bool showBackButton;
//   final List<Widget>? actions;
//   final Widget? leading;
//   final Function()? onBackPressed;
//   final double? appBarHeight;
//
//   final bool? isCenterTitle;
//
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.components,
//     this.showBackButton = false,
//     this.actions,
//     this.leading,
//     this.onBackPressed,
//     this.appBarHeight,
//     this.isCenterTitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//         systemNavigationBarColor: Colors.transparent,
//         systemNavigationBarIconBrightness: Brightness.dark,
//       ),
//       automaticallyImplyLeading: false,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomRight,
//             end: Alignment.topLeft,
//             stops: const [0.1, 0.8],
//             colors: [
//               context.customColorStyle!.lightPrimary!,
//               context.customColorStyle!.darkPrimary!,
//             ],
//           ),
//         ),
//         child: components,
//       ),
//       leadingWidth: 60,
//       toolbarHeight: 90,
//       title: title,
//       titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: context.customColorStyle!.white),
//       centerTitle: isCenterTitle ?? true,
//       leading: showBackButton
//           ? IconButton(
//               icon: const Icon(Icons.arrow_back, size: 26),
//               color: context.customColorStyle!.white,
//               onPressed: onBackPressed ?? () => context.pop(),
//             )
//           : leading,
//       actions: actions ?? [],
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(appBarHeight ?? 140);
// }
