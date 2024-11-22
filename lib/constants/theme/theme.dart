import 'package:flutter/material.dart';
import 'package:music_app/constants/theme/custom_theme/appbar_theme.dart';
import 'package:music_app/constants/theme/custom_theme/bottomsheet_theme.dart';
import 'package:music_app/constants/theme/custom_theme/checkbox_theme.dart';
import 'package:music_app/constants/theme/custom_theme/chip_theme.dart';
import 'package:music_app/constants/theme/custom_theme/elevatedbutton_theme.dart';
import 'package:music_app/constants/theme/custom_theme/outlinedbutton_theme.dart';
import 'package:music_app/constants/theme/custom_theme/text_theme.dart';

import '../colors.dart';

class AppTheme {
  /// Light Theme
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'IBMPlexSans',
    elevatedButtonTheme: ZohElevatedButton.lightElevatedButtonTheme,
    textTheme: ZohTextTheme.lightTextTheme,
    appBarTheme: ZohAppBar.lightAppBarTheme,
    bottomSheetTheme: ZohBottomSheet.lightBottomSheetTheme,
    checkboxTheme: ZohCheckBox.lightCheckBoxTheme,
    chipTheme: ZohChipTheme.lightChipTheme,
    outlinedButtonTheme:ZohOutlinedButton.lightOutlinedButtonTheme,
  );

  /// Dark Theme
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'IBMPlexSans',
    elevatedButtonTheme: ZohElevatedButton.darkElevatedButtonTheme,
    textTheme: ZohTextTheme.darkTextTheme,
    appBarTheme: ZohAppBar.darkAppBarTheme,
    bottomSheetTheme: ZohBottomSheet.darkThemeSheetTheme,
    checkboxTheme: ZohCheckBox.darkCheckBoxTheme,
    chipTheme: ZohChipTheme.darkChipTheme,
    outlinedButtonTheme: ZohOutlinedButton.darkOutlinedButtonTheme,
  );
}
