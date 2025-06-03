import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

extension htmlText on String? {
  bool get isHTML {
    final RegExp htmlRegExp =
        RegExp('<[^>]*>', multiLine: true, caseSensitive: false);
    return this?.isEmpty == true ? false : htmlRegExp.hasMatch(this!);
  }
}

class AppTextHTML extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  const AppTextHTML({
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return text.isHTML
        ? HtmlWidget(
// the first parameter (`html`) is required
            text,

            renderMode: RenderMode.column,

// set the default styling for text
            enableCaching: true,
          )
        : Text(
            text,
            key: key,
            overflow: overflow,
            style: textStyle,
            maxLines: maxLines,
            textAlign: textAlign,
          );
  }
}
