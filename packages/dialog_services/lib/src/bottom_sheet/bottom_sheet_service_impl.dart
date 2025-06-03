// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@Injectable(as: BottomSheetService)
class BottomSheetServiceImpl extends BottomSheetService {
  final NavigationService _navigationService;
  BottomSheetServiceImpl(this._navigationService);
  @override
  Future<dynamic> showBottomSheet(Widget bottomSheet) {
    return showModalBottomSheet(
      context: _navigationService.context!,
      builder: (_) => bottomSheet,
    );
  }
}
