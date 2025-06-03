import 'package:flutter/material.dart';

import '../../ui.dart';

class AppTextInputField extends StatelessWidget {
  const AppTextInputField({
    this.focusNode,
    this.autofocus = false,
    this.hintText,
    this.labelText,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    this.prefix,
    this.maxLines,
    this.onFieldSubmitted,
    this.minLines,
    this.style,
    this.suffixSvg,
    this.focusColor,
    this.suffix,
    this.suffixIcon,
    this.errorMessage,
    this.readOnly = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.textAlignVertical,
    this.onChanged,
    this.fillColor,
    this.hintStyle,
    this.labelStyle,
    this.contentPadding,
    this.decoration,
  });

  final Color? focusColor;
  final String? hintText;
  final String? labelText;
  final String? errorMessage;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixSvg;
  final Widget? prefix;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool obscureText;
  final TextStyle? style;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsets? contentPadding;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return buildAppFormField(context);
  }

  Widget buildAppFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFormField(
          autofocus: autofocus,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          focusColor: focusColor,
          fillColor: fillColor,
          readOnly: readOnly,
          expands: expands,
          style: style,
          errorMessage: errorMessage,
          obscureText: obscureText,
          enabled: enabled,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: keyboardType,
          hintText: hintText,
          // labelText: labelText,
          suffix: suffix,
          suffixIcon: _buildSuffixIcon(),
          prefix: prefix,
          controller: controller,
          focusNode: focusNode,
          textAlignVertical: textAlignVertical,
          onChanged: onChanged,
          contentPadding: contentPadding,
          decoration: decoration,
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon != null) return suffixIcon;
    if (suffixSvg != null) return AppSVGImage(image: suffixSvg!);

    return null;
  }
}

class AppFormField extends StatelessWidget {
  AppFormField({
    this.labelStyle,
    super.key,
    this.autofocus = false,
    this.readOnly = false,
    this.expands = false,
    this.style,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.decoration,
    this.focusColor,
    this.fillColor,
    this.hintText,
    this.labelText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.suffixWidthConstraints = 30,
    this.prefixWidthConstraints = 30,
    this.controller,
    this.focusNode,
    this.hintStyle,
    this.contentPadding,
    this.onChanged,
    this.errorMessage,
    this.textAlignVertical,
    this.isDense = false,
    this.onTap,
  });

  final String? errorMessage;
  final bool autofocus;
  final bool readOnly;
  final bool expands;
  final TextStyle? style;
  final bool obscureText;
  final bool enabled;
  final Color? focusColor;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final double suffixWidthConstraints;
  final double prefixWidthConstraints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? hintText;
  final String? labelText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      obscureText: obscureText,
      enabled: enabled,
      decoration: decoration ??
          InputDecoration(
              hintText: hintText, labelText: labelText, suffixIcon: suffixIcon),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      // scrollPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // cursorColor: context.customColorStyle!.primary!,
      controller: controller,
      focusNode: focusNode,
    );
  }
}
