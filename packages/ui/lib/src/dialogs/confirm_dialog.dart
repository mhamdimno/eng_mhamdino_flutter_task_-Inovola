import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({required this.message, required this.onTap, super.key});

  final String message;
  final void Function()? onTap;

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
              // AppSVGImage(image: Assets.icons.),
              onTap != null ? 0.heightBox : 20.heightBox,
              AppText(
                   onTap == null ? 'Success' : "",
                  style: context.textTheme.headlineLarge!.copyWith(
                      color: context.customColorStyle!.green,
                      fontWeight: FontWeight.w500)),
              onTap != null ? 0.heightBox : 10.heightBox,
              AppText(
                   message,
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
    return Row(
      children: [
        onTap != null
            ? Expanded(
                child: AppButton(
                  onTap: onTap,
                  text: 'Confirm',
                  type: ButtonType.primary,
                  buttonColor: context.customColorStyle?.primary,
                  borderColor: context.customColorStyle?.primary,
                  textStyle: context.textTheme.headlineSmall
                      ?.copyWith(color: context.customColorStyle?.white),
                ),
              )
            : 0.widthBox,
        onTap != null ? 4.widthBox : 0.widthBox,
        Expanded(
          child: AppButton(
            onTap: context.pop,
            text: 'Close',
            type: onTap != null ? ButtonType.secondary : ButtonType.primary,
            textStyle: context.textTheme.headlineSmall?.copyWith(
                color: onTap != null
                    ? context.customColorStyle?.black
                    : context.customColorStyle?.white),
          ),
        ),
      ],
    );
  }
}
