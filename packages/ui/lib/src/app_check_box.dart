import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppCheckBox extends StatefulWidget {
  AppCheckBox(
      {super.key,
      required this.label,
      this.initialState,
      this.labelStyle,
      required this.onChange});
  final String label;
  bool? initialState;
  TextStyle? labelStyle;
  final ValueChanged<bool> onChange;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool isSelected;
  @override
  void initState() {
    isSelected = widget.initialState ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _customCheckBox(context),
        Expanded(
            child: AppText(
          widget.label,
          style: widget.labelStyle ??
              context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
        )),
      ],
    );
  }

  InkWell _customCheckBox(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onChange(isSelected);
        });
      },
      child: Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: isSelected,
          onChanged: (value) {
            setState(() {
              isSelected = !isSelected;
              widget.onChange(isSelected);
            });
          }),
    );
  }
}
