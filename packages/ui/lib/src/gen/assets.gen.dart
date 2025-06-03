/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back_icon.svg
  String get backIcon => 'packages/ui/assets/icons/back_icon.svg';

  /// File path: assets/icons/dialog.svg
  String get dialog => 'packages/ui/assets/icons/dialog.svg';

  /// File path: assets/icons/error.svg
  String get error => 'packages/ui/assets/icons/error.svg';

  /// File path: assets/icons/language.svg
  String get language => 'packages/ui/assets/icons/language.svg';

  /// File path: assets/icons/password.svg
  String get password => 'packages/ui/assets/icons/password.svg';

  /// File path: assets/icons/warning.svg
  String get warning => 'packages/ui/assets/icons/warning.svg';

  /// List of all assets
  List<String> get values =>
      [backIcon, dialog, error, language, password, warning];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/placeholder.jpg
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [placeholder];
}

class Assets {
  Assets._();

  static const String package = 'ui';

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  static const String package = 'ui';

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/ui/$_assetName';
}
