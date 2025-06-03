import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  const AppText(
    this.text, {
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      key: key,
      overflow: overflow,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
