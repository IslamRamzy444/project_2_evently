import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class EventTabItem extends StatelessWidget {
  String title;
  IconData icon;
  bool isSelected;
  Color? borderColor;
  Color selectedBgColor;
  Color selectedIconColor;
  Color unSelectedIconColor;
  TextStyle selectedStyle;
  TextStyle unSelectedStyle;
  EventTabItem({super.key,required this.title,required this.icon,required this.isSelected,this.borderColor,required this.selectedBgColor,required this.unSelectedStyle,required this.unSelectedIconColor,required this.selectedStyle,required this.selectedIconColor});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02*height,horizontal: 0.025*width),
      padding: EdgeInsets.symmetric(vertical: 0.009*height,horizontal: 0.04*width),
      decoration: BoxDecoration(
        color: isSelected?selectedBgColor:AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          width: 2,
          color:borderColor??Theme.of(context).focusColor
        )
      ),
      child: Row(
        children: [
          Icon(icon,color: isSelected?selectedIconColor:unSelectedIconColor,),
          SizedBox(width: 0.02*width,),
          Text(title,style: isSelected?selectedStyle:unSelectedStyle,)
        ],
      ),
    );
  }
}