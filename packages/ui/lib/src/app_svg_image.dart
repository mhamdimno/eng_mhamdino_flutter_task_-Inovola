// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVGImage extends StatelessWidget {
  const AppSVGImage({super.key, required this.image, this.boxFit, this.height, this.width, this.color});
  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      color: color,
      fit: boxFit ?? BoxFit.contain,
    );
  }
}
