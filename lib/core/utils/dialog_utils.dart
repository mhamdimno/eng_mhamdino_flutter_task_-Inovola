import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils._internal();

  factory DialogUtils() {
    return _instance;
  }

  DialogUtils._internal();

  /// Reusable confirmation dialog
  DialogModel getConfirmDialog({
    required String title,
    required String description,
    String? primaryText,
    Function()? onPrimaryTapped,
    Function()? onSecondaryTapped,
  }) {
    return DialogModel.action(
      title: title,
      description: description,
      icon: const Icon(Icons.question_mark, size: 50, color: Colors.blue),
      iconBackColor: Colors.black,
      primaryText: primaryText ?? "Yes, Save changes",
      secondaryText: "No, Go back",
      onPrimaryTapped: onPrimaryTapped,
    );
  }
}
