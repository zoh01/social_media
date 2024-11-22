import 'package:flutter/material.dart';
import 'package:music_app/constants/colors.dart';

class ZohElevatedButton {
  ZohElevatedButton._();
  ///Light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: AppColors.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );

  ///Dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: AppColors.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );
}