import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  AppIcon({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) SizedBox.new;
    if (imageUrl!.contains('http')) return _buildNetworkImage(context);
    return _buildAssetImages(context);
  }

  Widget _buildAssetImages(BuildContext context) {
    if (imageUrl!.endsWith('.svg')) {
      return SvgPicture.asset(
        imageUrl!,
        width: width,
        height: height,
        colorFilter: colorFilter,
        fit: fit,
        allowDrawingOutsideViewBox: true,
      );
    } else {
      return Image.asset(
        imageUrl!,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }

  Widget _buildNetworkImage(BuildContext context) {
    if (imageUrl!.endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl!,
        width: width,
        height: height,
        colorFilter: colorFilter,
        fit: fit,
        allowDrawingOutsideViewBox: true,
      );
    } else {
      return Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }
}
