import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.svgLeading,
    required this.titleText,
    this.color,
    this.onPressed,
    this.titleTextStyle,
    this.trailing,
    this.subtitle,
    this.textStyle,
    this.contentPadding,
    this.colorFilter,
    this.iconWidth,
    this.iconHeight,
  });
  final Color? color;
  final String? svgLeading;
  final Function()? onPressed;
  final String titleText;
  final TextStyle? titleTextStyle;
  final Widget? trailing;
  final Widget? subtitle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? colorFilter;
  final double? iconWidth;
  final double? iconHeight;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      minLeadingWidth: 10,
      enableFeedback: true,
      leading: svgLeading != null
          ? AppImage(
              path: svgLeading,
              width: iconWidth,
              height: iconHeight,
            )
          : null,
      trailing: trailing,
      onTap: onPressed,
      title: AppText(
          titleText,
          style: textStyle ?? context.textTheme.headlineMedium),
      titleTextStyle: titleTextStyle,
      subtitle: subtitle,
    );
  }
}
