import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({required this.dialogModel, super.key});

  final DialogModel dialogModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(AppCorners.md)),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 450,
          decoration: BoxDecoration(
              color: context.customColorStyle!.white,
              borderRadius: BorderRadius.circular(AppCorners.md)),
          child: Center(child: _buildBody(context)),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          32.heightBox,
          if (dialogModel.image != null)
            AppSVGImage(image: dialogModel.image ?? ""),
          if (dialogModel.icon != null) dialogModel.icon!,
          12.heightBox,
          AppText(
            dialogModel.title,
            style: context.textTheme.headlineMedium!.copyWith(
                color: context.customColorStyle!.primary, fontSize: 18),
          ),
          5.heightBox,
          AppText(
            dialogModel.description,
            style: context.textTheme.bodyLarge!.copyWith(
                color: context.customColorStyle!.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          26.heightBox,
          _buildActions(context),
          24.heightBox,
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        if (dialogModel.dialogType == DialogType.action) ...[
          AppButton(
            onTap: dialogModel.onPrimaryTapped ?? context.pop,
            text: dialogModel.primaryText,
            type: ButtonType.primary,
            buttonColor: context.customColorStyle?.primary,
            borderColor: context.customColorStyle?.primary,
            textStyle: context.textTheme.headlineSmall
                ?.copyWith(color: context.customColorStyle?.white),
          ),
          32.heightBox,
          AppButton(
            onTap: dialogModel.onSecondaryTapped ?? context.pop,
            text: dialogModel.secondaryText!,
            buttonColor: context.customColorStyle!.lightGrey!,
            borderColor: context.customColorStyle!.lightGrey!,
            textColor: context.customColorStyle!.primary!,
            type: ButtonType.secondary,
          ),
          8.widthBox,
        ],
      ],
    );
  }
}
