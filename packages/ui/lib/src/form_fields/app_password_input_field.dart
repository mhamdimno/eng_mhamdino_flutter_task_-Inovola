// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppPasswordInputField extends StatefulWidget {
  const AppPasswordInputField({
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.errorMessage,
    this.validator,
    this.autofocus = false,
    this.onChanged,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? errorMessage;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  _AppPasswordInputFieldState createState() => _AppPasswordInputFieldState();
}

class _AppPasswordInputFieldState extends State<AppPasswordInputField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextInputField(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      maxLines: 1,
      labelText: widget.labelText,
      hintText: widget.hintText ?? "*************",
      validator: widget.validator,
      errorMessage: widget.errorMessage,
      controller: widget.controller,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 24,
            // color: context.customColorStyle!.primary!,
          ),
        ),
      ),
    );
  }
}
