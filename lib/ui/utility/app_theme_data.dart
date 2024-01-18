import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch:
        MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: Colors.grey,
        )),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 45),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      )
    )
  );
}
