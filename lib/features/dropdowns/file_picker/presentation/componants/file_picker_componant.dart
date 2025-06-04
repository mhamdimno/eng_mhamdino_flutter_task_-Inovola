import 'package:flutter/material.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/file_picker/data/model/file_picker_model.dart';
import 'package:shared/shared.dart';
import 'package:file_picker/file_picker.dart';

import 'package:ui/ui.dart';

class FilePickerComponant extends StatefulWidget {
  const FilePickerComponant({
    super.key,
    this.topText,
    this.isRequired,
    required this.onSelectItem,
  });
  final Function(FilePickerModel) onSelectItem;
  final String? topText;
  final bool? isRequired;

  @override
  State<FilePickerComponant> createState() => _FilePickerComponantState();
}

class _FilePickerComponantState extends State<FilePickerComponant> {
  final TextEditingController _controller = TextEditingController();
  // final FilePickerCubit _filePickerCubit = getIt<FilePickerCubit>();
  Future<FilePickerModel> getFilePickerData() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    return FilePickerModel(
        path: result?.files.single.path!,
        name: result?.files.single.path?.split('/').last);
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
            getFilePickerData().then((value) {
              _controller.text = value.name ?? "";
              widget.onSelectItem(value);
            });

            // });
          },
          child: AbsorbPointer(
            absorbing: false, // Disable if _isDisabled is true

            child: AppTextInputField(
              validator: widget.isRequired == true
                  ? AppFormValidator()
                      .requiredField("File is Required")
                      .validate
                  : null,

              // fillColor: context.customColorStyle!.white,
              labelStyle: context.textTheme.bodyMedium,
              controller: _controller,
              enabled: false,
              labelText: widget.topText,
              hintText: "Select File",
              suffixIcon: const Icon(
                Icons.camera_alt_outlined,
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
