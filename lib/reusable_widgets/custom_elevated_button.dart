import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String butTitle;
  Color backgroundColor;
  Color borderSideColor;
  bool hasIcon;
  Widget? widget;
  CustomElevatedButton({super.key,required this.onPressed,required this.butTitle,this.backgroundColor=AppColors.primaryLight,this.borderSideColor=AppColors.primaryLight,this.hasIcon=false,this.widget});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.sizeOf(context).height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderSideColor)
        ),
        padding: EdgeInsets.symmetric(vertical: 0.03*height)
      ),
      onPressed:onPressed, 
      child:hasIcon?widget: Text(butTitle,style: AppStyles.mediumWhite20,)
    );
  }
}