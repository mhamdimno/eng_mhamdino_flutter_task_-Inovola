// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final NavigationService _navigationService;

  DialogServiceImpl(this._navigationService);

  BuildContext get _context => _navigationService.context!;

  @override
  Future<void> showAppDialog(DialogModel model) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => AppDialog(dialogModel: model),
    );
  }

  @override
  Future<void> showErrorMessage(String error) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => ErrorDialog(message: error),
    );
  }

  @override
  Future<void> showSuccessMessage(String massage) async {
    await showDialog<void>(
      context: _context,
      barrierDismissible: true,
      builder: (_) => SuccessDialog(message: massage),
    );
  }

  @override
  Future<void> confirmMessage(String message, void Function()? onTap) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => ConfirmDialog(message: message, onTap: onTap),
    );
  }

  @override
  Future<void> showWarningMessage(String error) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => WarningDialog(message: error),
    );
  }
}
