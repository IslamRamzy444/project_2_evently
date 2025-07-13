import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.primaryLight,
    focusColor: AppColors.whiteColor,
    hintColor: AppColors.primaryLight,
    primaryColorDark: AppColors.whiteColor,
    primaryColorLight: AppColors.blackColor,
    dividerColor: AppColors.whiteColor3,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.boldWhite12,
      unselectedLabelStyle: AppStyles.boldWhite12
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: StadiumBorder(side: BorderSide(color: AppColors.whiteColor,width: 4)),
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.mediumBlack16,
      headlineMedium: AppStyles.mediumPrimary16,
      headlineSmall: AppStyles.mediumWhite16,
      headlineLarge: AppStyles.boldBlack20
    )
  );


  static final ThemeData darkTheme=ThemeData(
    primaryColor: AppColors.primaryDark,
    focusColor: AppColors.primaryLight,
    hintColor: AppColors.whiteColor,
    primaryColorDark: AppColors.whiteColor,
    primaryColorLight: AppColors.whiteColor,
    dividerColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.boldWhite12,
      unselectedLabelStyle: AppStyles.boldWhite12
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: StadiumBorder(side: BorderSide(color: AppColors.whiteColor,width: 4)),
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.mediumWhite16,
      headlineMedium: AppStyles.mediumWhite16,
      headlineSmall: AppStyles.mediumWhite16,
      headlineLarge: AppStyles.boldWhite20
    )
  );
}