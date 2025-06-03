/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Inter-Regular.ttf
  String get interRegular => 'assets/fonts/Inter-Regular.ttf';

  /// List of all assets
  List<String> get values => [interRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.png
  AssetGenImage get add => const AssetGenImage('assets/icons/add.png');

  /// File path: assets/icons/arrowdown.png
  AssetGenImage get arrowdown =>
      const AssetGenImage('assets/icons/arrowdown.png');

  /// File path: assets/icons/arrowtop.png
  AssetGenImage get arrowtop =>
      const AssetGenImage('assets/icons/arrowtop.png');

  /// File path: assets/icons/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/icons/cart.png');

  /// File path: assets/icons/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/icons/entertainment.png');

  /// File path: assets/icons/gas.png
  AssetGenImage get gas => const AssetGenImage('assets/icons/gas.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/news_papper.png
  AssetGenImage get newsPapper =>
      const AssetGenImage('assets/icons/news_papper.png');

  /// File path: assets/icons/person.png
  AssetGenImage get person => const AssetGenImage('assets/icons/person.png');

  /// File path: assets/icons/rent.png
  AssetGenImage get rent => const AssetGenImage('assets/icons/rent.png');

  /// File path: assets/icons/shopping.png
  AssetGenImage get shopping =>
      const AssetGenImage('assets/icons/shopping.png');

  /// File path: assets/icons/transport.png
  AssetGenImage get transport =>
      const AssetGenImage('assets/icons/transport.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        add,
        arrowdown,
        arrowtop,
        cart,
        entertainment,
        gas,
        home,
        newsPapper,
        person,
        rent,
        shopping,
        transport
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/eng_mhamdino.jpg
  AssetGenImage get engMhamdino =>
      const AssetGenImage('assets/images/eng_mhamdino.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [engMhamdino, logo];
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/local_data.json
  String get localData => 'assets/jsons/local_data.json';

  /// List of all assets
  List<String> get values => [localData];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
