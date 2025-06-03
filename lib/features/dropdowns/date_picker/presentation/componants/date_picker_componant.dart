import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/file_picker/data/model/file_picker_model.dart';
import 'package:shared/shared.dart';

import 'package:ui/ui.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

enum DateTimeType { date, time, dateAndTime }

class DateTimeString {
  DateTime? dateTime;
  String? dateString;
  DateTimeString({this.dateTime, this.dateString});
}

class DatePickerComponant extends StatefulWidget {
  const DatePickerComponant({
    super.key,
    this.topText,
    this.isRequired,
    required this.onSelectItem,
  });
  final Function(DateTimeString) onSelectItem;
  final String? topText;
  final bool? isRequired;

  @override
  State<DatePickerComponant> createState() => _DatePickerComponantState();
}

class _DatePickerComponantState extends State<DatePickerComponant> {
  final TextEditingController _controller = TextEditingController();
  // final FilePickerCubit _filePickerCubit = getIt<FilePickerCubit>();

  static formatTimeSince(DateTime? pastDateTime) {
    if (pastDateTime == null) {
      return 'No date selected';
    }
    final now = DateTime.now();
    final difference = now.difference(pastDateTime);

    // Get only the date part of now and pastDateTime for comparison
    final today = DateTime(now.year, now.month, now.day);
    final eventDate =
        DateTime(pastDateTime.year, pastDateTime.month, pastDateTime.day);

    // Check if the event happened today
    if (eventDate.isAtSameMomentAs(today)) {
      // If it's today, handle specific time formats
      if (difference.inSeconds < 60) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else if (difference.inHours < 24) {
        // It's today, format as "today X:XX AM/PM"
        final timeFormatter = DateFormat('h:mm a'); // e.g., 1:00 PM
        return 'Today ${timeFormatter.format(pastDateTime)}';
      }
    }

    // If not today, fall back to general "X days/weeks/months/years ago"
    if (difference.inDays == 1) {
      return 'Yesterday'; // Specific for yesterday
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    }
  }

  static Future<DateTimeString?> chooseDateTime(BuildContext context,
      {DateTimeType type = DateTimeType.date,
      bool supportOldDate = true,
      bool supportNewDate = false}) async {
    //  var _selectedDate = DateTime.now().obs;
    final DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
          DateTime.now().subtract(Duration(days: supportOldDate ? 3652 : 0)),
      lastDate: DateTime.now().add(
        Duration(days: supportNewDate ? 3652 : 0),
      ),
      is24HourMode: true,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      type: OmniDateTimePickerType.dateAndTime,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: context.colorScheme.primary,
          brightness: Brightness.light,
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      // selectableDayPredicate: (dateTime) {
      //   // Disable 25th Feb 2023
      //   if (dateTime == DateTime(2023, 2, 25)) {
      //     return false;
      //   } else {
      //     return true;
      //   }
      // },
    );
    return DateTimeString(
      dateTime: dateTime,
      dateString:
          dateTime != null ? formatTimeSince(dateTime) : 'No date selected',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          cardColor: context.customColorStyle!.white,
          canvasColor: context.customColorStyle!.white,
        ),
        child: InkWell(
          onTap: () {
            // setState(() {
            chooseDateTime(context).then((value) {
              _controller.text = value?.dateString ?? '';
              widget.onSelectItem(value ?? DateTimeString());
            });

            // });
          },
          child: AbsorbPointer(
            absorbing: false, // Disable if _isDisabled is true

            child: AppTextInputField(
              validator: widget.isRequired == true
                  ? AppFormValidator()
                      .requiredField("Date is Required")
                      .validate
                  : null,
              // fillColor: context.customColorStyle!.white,
              labelStyle: context.textTheme.bodyMedium,
              controller: _controller,
              enabled: false,
              labelText: widget.topText,
              hintText: "Date",
              suffixIcon: const Icon(
                Icons.calendar_month,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
        )

        //  DropdownButtonFormField<PropertiesModel>(
        //   dropdownColor: context.customColorStyle!.white,
        //   focusColor: context.customColorStyle!.white,
        //   decoration: InputDecoration(
        //     // labelText: context.localization.property,
        //     labelStyle: context.textTheme.bodyMedium!
        //         .copyWith(color: context.customColorStyle!.grey),
        //     contentPadding:
        //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(AppCorners.sm),
        //       borderSide:
        //           BorderSide(color: context.customColorStyle!.grey!),
        //     ),
        //   ),
        //   borderRadius: BorderRadius.circular(AppCorners.sm),
        //   icon: Icon(Icons.keyboard_arrow_down,
        //       color: context.customColorStyle!.grey, size: 24),
        //   items: state.properties.map((item) {
        //     return DropdownMenuItem<PropertiesModel>(
        //       value: item,
        //       child: AppText(text: item.name ?? ''),
        //     );
        //   }).toList(),
        //   onChanged: (value) {
        //     onSelectProperity(value!);
        //   },
        // ),
        // );
        //   },
        // ),
        );
  }
}
