import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.customColorStyle?.grey?.withValues(alpha: 0.4),
      height: 1,
      thickness: .5,
    );
  }
}
