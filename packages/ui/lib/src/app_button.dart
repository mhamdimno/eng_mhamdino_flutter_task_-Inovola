import 'package:flutter/material.dart';
import '../ui.dart';

enum ButtonType { primary, secondary, alert, text }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.type,
    this.textColor,
    this.onTap,
    this.padding,
    this.center = false,
    this.isLoading = false,
    this.isSmall = false,
    this.leadingIcon,
    this.leading,
    this.trailingIcon,
    this.trailing,
    this.textStyle,
    this.buttonColor,
    this.borderColor,
    this.disabled = false,
    this.margin,
    this.borderRadius,
  });

  final bool disabled;
  final bool center;
  final String text;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ButtonType type;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool isSmall;
  final String? leadingIcon;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingIcon;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const AppLoading();
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: !disabled ? onTap : null,
        child: Container(
          constraints: BoxConstraints(maxHeight: 54, minHeight: 54),
          // padding: padding ?? EdgeInsets.symmetric(vertical: isSmall ? 6 : 12, horizontal: isSmall ? 12 : 16),
          decoration: BoxDecoration(
              gradient: disabled
                  ? null
                  : const LinearGradient(
                      colors: [
                        Color(0xFF4A68FF),
                        Color(0xFF4A68FF),
                        Color(0xFF4A68FF),
                        Color.fromARGB(255, 158, 174, 254),
                      ], // Example gradient colorsr
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
              borderRadius: BorderRadius.circular(8.0),
              color: buttonColor ?? type.getFilledColor(context, disabled),
              border: Border.all(
                  color:
                      borderColor ?? type.getBorderColor(context, disabled))),
          child: _buildLayout(context),
        ),
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    if (trailingIcon != null ||
        leadingIcon != null ||
        leading != null ||
        trailing != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null || leading != null)
            leading ?? _buildIcon(context, leadingIcon!),
          8.widthBox,
          _buildText(context),
          8.widthBox,
          if (trailingIcon != null || trailing != null)
            trailing ?? _buildIcon(context, trailingIcon!),
        ],
      );
    }
    return Center(child: _buildText(context));
  }

  AppSVGImage _buildIcon(BuildContext context, String icon) => AppSVGImage(
        image: icon,
        width: isSmall ? 16 : 20,
        height: isSmall ? 16 : 20,
        color: context.customColorStyle!.white,
      );

  AppText _buildText(BuildContext context) {
    return AppText(text,
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: getTextStyle(context));
  }

  TextStyle getTextStyle(BuildContext context) {
    if (textStyle != null) return textStyle!;

    return isSmall
        ? context.textTheme.bodySmall!.copyWith(
            color: textColor ?? type.getTextColor(context),
            fontWeight: FontWeight.w500)
        : context.textTheme.labelLarge!
            .copyWith(color: textColor ?? type.getTextColor(context));
  }
}

extension ButtonTypeExtension on ButtonType {
  Color getFilledColor(BuildContext context, bool disabled) {
    switch (this) {
      case ButtonType.primary:
        return disabled
            ? context.customColorStyle!.grey!
            : context.customColorStyle!.primary!;

      case ButtonType.secondary:
        return disabled ? context.customColorStyle!.white! : Colors.transparent;

      case ButtonType.alert:
        return context.customColorStyle!.transparent!;

      case ButtonType.text:
        return context.customColorStyle!.transparent!;
    }
  }

  Color getBorderColor(BuildContext context, bool disabled) {
    switch (this) {
      case ButtonType.primary:
        return disabled
            ? context.customColorStyle!.grey!
            : context.customColorStyle!.primary!;

      case ButtonType.secondary:
        return disabled
            ? context.customColorStyle!.white!
            : context.customColorStyle!.black!;

      case ButtonType.alert:
        return context.customColorStyle!.transparent!;

      case ButtonType.text:
        return context.customColorStyle!.transparent!;
    }
  }

  Color? getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return context.customColorStyle!.white!;
      case ButtonType.secondary:
        return context.customColorStyle!.black!;
      case ButtonType.alert:
        return context.customColorStyle!.red!;
      case ButtonType.text:
        return context.customColorStyle!.black;
    }
  }
}
