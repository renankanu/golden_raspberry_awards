import 'package:flutter/material.dart';
import '../core.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.creamCan,
    background: Colors.white,
  ),
  primaryColor: AppColors.creamCan,
  dividerTheme: const DividerThemeData(
    color: AppColors.mineShaft,
    thickness: 0.5,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.mineShaft,
    selectionColor: AppColors.mineShaft,
    selectionHandleColor: AppColors.mineShaft,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    labelStyle: TextStyle(
      color: AppColors.mineShaft,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.mineShaft,
        width: 0.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.mineShaft,
        width: 0.5,
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.mineShaft,
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.mineShaft,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.mineShaft,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.mineShaft,
    ),
  ),
);
