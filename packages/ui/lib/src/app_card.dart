import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.roundedCorder = true,
    this.elevation,
    this.margin,
    this.borderRadius,
    this.padding,
  });
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final bool roundedCorder;
  final double? elevation;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.all(2),
      child: Card(
        elevation: elevation ?? 4,
        shape: roundedCorder ? RoundedRectangleBorder(borderRadius: borderRadius ?? AppCorners.smBorder) : null,
        color: color,
        margin: EdgeInsets.zero,
        shadowColor: shadowColor,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: child,
        ),
        surfaceTintColor: Colors.white,
      ),
    );
  }
}
