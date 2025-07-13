import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
        hintText: "Search for Event",
        hintStyle: AppStyles.boldPrimary14,
        prefixIcon: Icon(Icons.search,color: AppColors.primaryLight,)
      ),
    );
  }
  OutlineInputBorder buildBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryLight,width: 1)
    );
  }
}