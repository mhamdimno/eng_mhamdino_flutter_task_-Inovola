import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppTopTextInputField extends StatelessWidget {
  const AppTopTextInputField({
    this.topText,
    this.topWidget,
    this.child,
  });
  final String? topText;
  final Widget? topWidget;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topWidget != null) topWidget!,
        if (topText != null)
          AppText(
            topText!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
          ).setAnimation(AnimateType.slideInUp),
        8.heightBox,
        if (child != null)
          child!.setAnimation(
            AnimateType.slideInDown,
          ),
        8.heightBox,
      ],
    );
  }
}
