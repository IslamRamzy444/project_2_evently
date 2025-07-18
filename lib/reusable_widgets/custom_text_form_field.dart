import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
typedef OnValidator=String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  Color borderSideColor;
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? inputStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  OnValidator? validator;
  TextEditingController controller;
  TextInputType keyBoardType;
  bool obscureText;
  String obscuringCharacter;
  Color? cursorColor;
  CustomTextFormField({super.key,this.borderSideColor=AppColors.greyColor,this.hintText,this.hintStyle,this.prefixIcon,this.suffixIcon,this.maxLines,this.validator,required this.controller,this.keyBoardType=TextInputType.text,this.obscureText=false,this.obscuringCharacter=".",this.cursorColor,this.inputStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inputStyle??Theme.of(context).textTheme.bodySmall,
      cursorColor:cursorColor??Theme.of(context).primaryColorDark ,
      obscureText: obscureText,
      maxLines: maxLines??1,
      validator: validator,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle??Theme.of(context).textTheme.bodySmall,
        enabledBorder: buildMyBorder(borderSideColor: borderSideColor),
        focusedBorder: buildMyBorder(borderSideColor: borderSideColor),
        errorBorder: buildMyBorder(borderSideColor: AppColors.redColor),
        focusedErrorBorder: buildMyBorder(borderSideColor: AppColors.redColor),
        errorStyle: AppStyles.mediumPrimary16.copyWith(color: AppColors.redColor)
      ),
    );
  }
  OutlineInputBorder buildMyBorder({required borderSideColor}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1,color: borderSideColor)
    );
  }
}