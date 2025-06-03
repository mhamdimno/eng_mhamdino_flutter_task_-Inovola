import 'package:flutter/material.dart';

extension SizeExtensionBox on num {
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );

  Widget get heightBox => SizedBox(
        height: toDouble(),
      );
}
