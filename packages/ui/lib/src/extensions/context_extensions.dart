import 'package:flutter/material.dart';
import '../style/custom_color.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get themeData => Theme.of(this);
  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CustomColorStyle? get customColorStyle => themeData.extension<CustomColorStyle>();
  void pop() => Navigator.of(this).pop();
  double get sw => MediaQuery.of(this).size.width;
  double get sh => MediaQuery.of(this).size.height;
}
