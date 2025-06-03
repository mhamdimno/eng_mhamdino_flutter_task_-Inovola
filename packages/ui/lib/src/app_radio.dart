import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppRadio<T> extends StatelessWidget {
  AppRadio({
    super.key,
    required this.groupValue,
    required this.keyValue,
    this.onChanged,
    required this.title,
  });
  final T keyValue;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: AppText(title),
      value: keyValue,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
