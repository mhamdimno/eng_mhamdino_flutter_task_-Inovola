import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:ui/src/gen/assets.gen.dart';
import 'package:ui/src/style/app_styles.dart';

class AppImage extends StatefulWidget {
  const AppImage({
    super.key,
    required this.path,
    this.boxFit,
    this.height,
    this.width,
    this.placeholder,
    this.clipRRectBorderRadius,
    this.borderColor,
  });

  final String? path;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final double? clipRRectBorderRadius;
  final String? placeholder;
  final Color? borderColor;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.placeholder != null && widget.path == null) {
      return _buildAssetImage(widget.placeholder!);
    }
    return _buildImageWidget();
  }

  Widget _buildImageWidget() {
    return isRemote(widget.path)
        ? _buildRemoteImage()
        : _buildAssetImage(widget.path);
  }

  Widget _buildAssetImage(String? path) {
    return widget.borderColor == null
        ? _buildClipRRectImage(path)
        : Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.clipRRectBorderRadius ?? 0),
              border: Border.all(color: widget.borderColor!, width: 2),
            ),
            child: _buildClipRRectImage(path),
          );
  }

  Widget _buildClipRRectImage(String? path) {
    return widget.clipRRectBorderRadius == null
        ? _buildImage(path)
        : ClipRRect(
            borderRadius: BorderRadius.circular(widget.clipRRectBorderRadius!),
            child: _buildImage(path),
          );
  }

  Widget _buildImage(String? path) {
    if (path == null || path.isEmpty) {
      return Image.asset(
        Assets.images.placeholder.path,
        fit: widget.boxFit,
        width: widget.width,
        height: widget.height,
      );
    } else if (path.startsWith('/')) {
      // This is likely a file path
      return Image.file(
        File(path),
        fit: widget.boxFit,
        width: widget.width,
        height: widget.height,
        errorBuilder: (_, __, ___) => _errorImageLoad(),
      );
    } else {
      // Fallback to asset if unknown
      return Image.asset(
        path,
        fit: widget.boxFit,
        width: widget.width,
        height: widget.height,
        errorBuilder: (_, __, ___) => _errorImageLoad(),
      );
    }
  }

  Widget _buildRemoteImage() {
    return widget.clipRRectBorderRadius == null
        ? _cachedNetworkImage()
        : ClipRRect(
            borderRadius: BorderRadius.circular(widget.clipRRectBorderRadius!),
            child: _cachedNetworkImage(),
          );
  }

  CachedNetworkImage _cachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: widget.path ?? Assets.images.placeholder.path,
      width: widget.width,
      height: widget.height,
      fit: widget.boxFit,
      errorWidget: (_, __, ___) => _errorImageLoad(),
      placeholder: (_, __) => _buildAssetImage(Assets.images.placeholder.path),
    );
  }

  Center _errorImageLoad() {
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(widget.clipRRectBorderRadius ?? 0),
          child: Image.asset(
            Assets.images.placeholder.path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  bool isRemote(String? path) => path != null && path.startsWith('http');
  bool isVideo(String? path) =>
      path != null &&
      (path.endsWith('.mp4') || path.endsWith('.mov') || path.endsWith('.avi'));
}
