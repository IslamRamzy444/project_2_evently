import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.primaryLight,
    primaryColorLight: AppColors.blackColor,
    dividerColor: AppColors.whiteColor3,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
      bodyMedium: AppStyles.mediumBlack16
    )
  );


  static final ThemeData darkTheme=ThemeData(
    primaryColor: AppColors.primaryDark,
    primaryColorLight: AppColors.whiteColor,
    dividerColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(
      bodyMedium: AppStyles.mediumWhite16
    )
  );
}