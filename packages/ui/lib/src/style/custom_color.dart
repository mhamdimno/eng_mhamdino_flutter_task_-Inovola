import 'package:flutter/material.dart';

class CustomColorStyle extends ThemeExtension<CustomColorStyle> {
  Color? primary;
  Color? scaffoldBackground;
  Color? extraLightGrey;
  Color? lightGrey;
  Color? grey;
  Color? text;
  Color? black;
  Color? white;
  Color? red;
  Color? green;
  Color? yellow;
  Color? transparent ;

  CustomColorStyle({
    required this.primary,
    required this.scaffoldBackground,
    required this.extraLightGrey,
    required this.lightGrey,
    required this.grey,
    required this.text,
    required this.transparent,
    required this.black,
    required this.white,
    required this.red,
    required this.green,
    required this.yellow,
  });

  @override
  CustomColorStyle copyWith() {
    return CustomColorStyle(
      primary: primary,
      scaffoldBackground: scaffoldBackground,
      extraLightGrey: extraLightGrey,
      lightGrey: lightGrey,
      grey: grey,
      text: text,
      black: black,
      white: white,
      red: red,
      green: green,
      yellow: yellow,
      transparent: transparent,
    );
  }

  @override
  CustomColorStyle lerp(covariant ThemeExtension<CustomColorStyle>? other, double t) {
    if (other == null) return this;
    if (other is CustomColorStyle) {
      return CustomColorStyle(
        primary: Color.lerp(primary, other.primary, t),
        scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t),
        extraLightGrey: Color.lerp(extraLightGrey, other.extraLightGrey, t),
        lightGrey: Color.lerp(lightGrey, other.lightGrey, t),
        grey: Color.lerp(grey, other.grey, t),
        text: Color.lerp(text, other.text, t),
        black: Color.lerp(black, other.black, t),
        white: Color.lerp(white, other.white, t),
        red: Color.lerp(red, other.red, t),
        green: Color.lerp(green, other.green, t),
        yellow: Color.lerp(yellow, other.yellow, t),
        transparent: transparent,
      );
    }
    return this;
  }
}
