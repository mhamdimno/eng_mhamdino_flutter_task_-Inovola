import 'package:flutter/material.dart';
import 'package:ui/src/style/custom_color.dart';
import '../../ui.dart';

abstract class AppThemes {
  static const Color _primary = Color(0xff1639F1);
  static const Color _scaffoldBackground = Color(0xffF7FAFB);
  static const Color _extraLightGrey = Color(0xFFEBEEFF);
  static const Color _lightGrey = Color(0xffF2F4F9);
  static const Color _grey = Color(0xFF7D8892);
  static const Color _text = Color(0xff64748B);
  static const Color _black = Color(0xff000000);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _red = Color(0xFFE61F34);
  static const Color _green = Color(0xFF20B203);
  static const Color _yellow = Color(0xFFF6B920);
  static const Color _transparent = Colors.transparent;

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    primaryColor: _primary,
    primaryColorDark: _primary,
    primaryColorLight: _primary,
    secondaryHeaderColor: _primary,
    cardColor: const Color(0xFFFDF5ED),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: _white,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: AppCorners.smRadius,
          topRight: AppCorners.smRadius,
        ),
      ),
    ),
    hoverColor: const Color(0xFFEEFFF5),
    disabledColor: const Color(0xFFBFBDD1),

    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightGrey, // Changed to a light grey color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: _primary, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        hintStyle: TextStyle(color: Color(0xFFC9CFD4)), // Added hintStyle
        // labelStyle: TextStyle(color: Color(0xFFC9CFD4)), // Added hintStyle
        floatingLabelStyle:
            const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        // alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIconColor: Color(0xFFC9CFD4)
        // Added labelStyle
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFF4A68FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Ensure rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        elevation: 5, // Added elevation for a subtle shadow effect
        shadowColor: Colors.blueAccent.withOpacity(0.4), // Added shadow color
      ),
    ),
    scaffoldBackgroundColor: _scaffoldBackground,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _primary,
      onPrimary: const Color(0xFFCCF0DC),
      secondary: _primary,
      onSecondary: _primary,
      error: _red,
      onError: _red,
      surface: _grey,
      onSurface: _black,
    ),
    cardTheme: CardTheme(color: Color(0xffFFFFFF)),
    dividerColor: _grey,
    dividerTheme: DividerThemeData(color: _grey, thickness: 1),
    appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0.0,
        surfaceTintColor:
            Colors.transparent, // Removes the tint color on scroll
        // Removes elevation change on scroll

        iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: _white,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: _black,
            overflow: TextOverflow.ellipsis),
        elevation: 0),
    extensions: {
      CustomColorStyle(
        primary: _primary,
        scaffoldBackground: _scaffoldBackground,
        extraLightGrey: _extraLightGrey,
        lightGrey: _lightGrey,
        grey: _grey,
        text: _text,
        black: _black,
        white: _white,
        red: _red,
        green: _green,
        yellow: _yellow,
        transparent: _transparent,
      )
    },
    datePickerTheme: DatePickerThemeData(
        dayStyle:
            TextStyle(color: _black, fontSize: 14, fontWeight: FontWeight.w500),
        backgroundColor: _black),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      indicatorColor: Color(0xffFFFFFF),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: _primary);
        }
        return IconThemeData(color: Colors.white);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _primary,
                overflow: TextOverflow.ellipsis);
          }
          return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              overflow: TextOverflow.ellipsis);
        },
      ),
    ),
    // --- Added TextTheme ---
    textTheme: const TextTheme(
      // Display styles (large, prominent text)
      displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'Inter'),
      displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'Inter'),
      displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: 'Inter'),

      // Headline styles (main headings)
      headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Inter'),
      headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'Inter'),
      headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: 'Inter'),

      // Title styles (subheadings, titles in app bars)
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Inter'),
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'Inter'),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: 'Inter'),

      // Body styles (body text)
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
          fontFamily: 'Inter'),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
          fontFamily: 'Inter'),
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
          fontFamily: 'Inter'),

      // Label styles (small text, e.g., captions, button text)
      labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Inter'), // For buttons
      labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          fontFamily: 'Inter'),
      labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
          fontFamily: 'Inter'),
    ),
  );
}
