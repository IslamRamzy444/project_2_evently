import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2_evently/utils/app_colors.dart';

class AppStyles {
  static TextStyle boldPrimary20=GoogleFonts.inter(
    fontWeight: FontWeight.w700,color: AppColors.primaryLight,fontSize: 20
  );
  static TextStyle mediumPrimary20=GoogleFonts.inter(
    fontWeight: FontWeight.w500,color: AppColors.primaryLight,fontSize: 20
  );
  static TextStyle mediumBlack16=GoogleFonts.inter(
    fontWeight: FontWeight.w500,color: AppColors.blackColor,fontSize: 16
  );
  static TextStyle mediumWhite16=GoogleFonts.inter(
    fontWeight: FontWeight.w500,color: AppColors.whiteColor2,fontSize: 16
  );
  static TextStyle mediumWhite20=GoogleFonts.inter(
    fontWeight: FontWeight.w500,color: AppColors.whiteColor3,fontSize: 20
  );
}