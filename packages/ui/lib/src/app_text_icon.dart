import 'package:flutter/widgets.dart';
import 'package:ui/ui.dart';

enum IconPosition { prefix, suffix }

class AppTextIcon extends StatelessWidget {
  const AppTextIcon({
    this.isExpanded = false,
    required this.text,
    this.icon,
    this.position = IconPosition.prefix,
    this.textStyle,
    this.iconWidget,
    super.key,
  });
  final String text;
  final String? icon;
  final Widget? iconWidget;
  final IconPosition position;
  final TextStyle? textStyle;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (position == IconPosition.prefix) ...[
          _buildIcon(),
          8.widthBox,
        ],
        _buildText(),
        if (position == IconPosition.suffix) ...[
          8.widthBox,
          _buildIcon(),
        ],
      ],
    );
  }

  Widget _buildText() {
    final textWidget = AppText(
      text,
      style: textStyle,
    );
    if (isExpanded) return Expanded(child: textWidget);
    return textWidget;
  }

  Widget _buildIcon() {
    return iconWidget ?? AppSVGImage(image: icon!);
  }
}
