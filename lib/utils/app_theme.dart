import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
  );


  static final ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDark
  );
}