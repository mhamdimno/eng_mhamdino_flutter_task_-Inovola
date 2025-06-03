import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

enum AppDateInputFieldType { date, time }

class AppDateInputField extends StatelessWidget {
  const AppDateInputField({
    this.controller,
    this.focusNode,
    this.validator,
    this.hintText,
    this.appDateInputFieldType = AppDateInputFieldType.date,
    this.autofocus = false,
    this.enabled = true,
    this.initialDate,
    this.firstDate,
    this.onChange,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool autofocus;
  final bool enabled;
  final AppDateInputFieldType appDateInputFieldType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => handleOnTap(context) : null,
      child: IgnorePointer(
        child: Column(
          children: [
            AppTextInputField(
              focusNode: focusNode,
              autofocus: autofocus,
              enabled: enabled,
              maxLines: 1,
              hintText: hintText,
              labelStyle: context.textTheme.headlineMedium,
              readOnly: true,
              validator: validator,
              controller: controller,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleOnTap(BuildContext context) async {
    String? timeText;

    if (appDateInputFieldType == AppDateInputFieldType.date) {
      final DateTime? time = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: context.customColorStyle!.primary!.withOpacity(.4), // header background color
                onPrimary: context.customColorStyle!.white!, // header text color
                onSurface: context.customColorStyle!.white!, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: context.customColorStyle!.white!, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (time != null) timeText = AppDateFormatter.dateToString(time);
    } else {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) timeText = time.format(context);
    }
    if (controller != null && timeText != null) {
      controller!.text = timeText;
    }
    if (onChange != null && timeText != null) {
      onChange!(timeText);
    }
  }
}
