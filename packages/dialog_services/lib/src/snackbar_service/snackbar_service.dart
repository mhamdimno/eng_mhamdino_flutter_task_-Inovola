// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton(as: SnackBarService)
class SnackBarServiceImpl implements SnackBarService {
  final NavigationService _navigationService;

  SnackBarServiceImpl(this._navigationService);

  @override
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(_navigationService.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  @override
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(_navigationService.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  @override
  void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(_navigationService.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.orangeAccent,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
