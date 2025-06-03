import 'package:flutter/material.dart';

class DialogModel {
  String title;
  String description;
  String? image;
  Widget? icon;
  Color iconBackColor;
  String primaryText;
  Color? primaryButtonColor;
  Color? secondaryButtonColor;
  String? secondaryText;
  Function()? onPrimaryTapped;
  Function()? onSecondaryTapped;
  late DialogType dialogType;
  DialogModel.confirm({
    required this.title,
    required this.description,
    this.image,
    this.icon,
    required this.iconBackColor,
    required this.primaryText,
    this.onPrimaryTapped,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.secondaryText,
    this.onSecondaryTapped,
  }) {
    dialogType = DialogType.confirmation;
  }

  DialogModel.action({
    required this.title,
    required this.description,
    this.image,
    this.icon,
    required this.iconBackColor,
    required this.primaryText,
    this.onPrimaryTapped,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    required this.secondaryText,
    this.onSecondaryTapped,
  }) {
    dialogType = DialogType.action;
  }
}

enum DialogType { action, confirmation }
