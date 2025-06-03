import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class VerticalButton extends StatelessWidget {
  const VerticalButton({
    super.key,
    required this.svg,
    required this.title,
    this.textStyle,
    this.svgSize,
    this.color,
  });

  final String svg;
  final String title;
  final TextStyle? textStyle;
  final double? svgSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSVGImage(
            image: svg,
            height: svgSize,
            width: svgSize,
          ),
          8.heightBox,
          AppText(
            title,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
