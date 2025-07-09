import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';

class MyCustomButton extends StatelessWidget {
  IconData icon;
  MyCustomButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37),
        border: Border.all(color: AppColors.primaryLight, width: 1),
      ),
      child: Icon(
        icon,
        color: AppColors.primaryLight,
        size: 30,
      ),
    );
  }
}
