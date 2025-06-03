import 'package:flutter/material.dart';
import 'package:ui/src/gen/assets.gen.dart';
import 'package:ui/ui.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        decoration: BoxDecoration(
            color: context.customColorStyle!.white,
            borderRadius: BorderRadius.circular(AppCorners.md)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSVGImage(image: Assets.icons.warning, width: 60, height: 60),
              10.heightBox,
              AppText('Warning',
                  style: context.textTheme.headlineLarge!.copyWith(
                      color: context.customColorStyle!.primary,
                      fontWeight: FontWeight.w500)),
              10.heightBox,
              AppText(message,
                  style: context.textTheme.bodyMedium!,
                  textAlign: TextAlign.center),
              20.heightBox,
              _buildActions(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return AppButton(
      onTap: context.pop,
      text: 'Ok',
      type: ButtonType.primary,
      buttonColor: context.customColorStyle?.primary,
      borderColor: context.customColorStyle?.primary,
      textStyle: context.textTheme.headlineSmall
          ?.copyWith(color: context.customColorStyle?.white),
    );
  }
}
