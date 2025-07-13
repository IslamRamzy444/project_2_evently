import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';

class EventTabItem extends StatelessWidget {
  String title;
  IconData icon;
  bool isSelected;
  EventTabItem({super.key,required this.title,required this.icon,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02*height,horizontal: 0.025*width),
      padding: EdgeInsets.symmetric(vertical: 0.009*height,horizontal: 0.04*width),
      decoration: BoxDecoration(
        color: isSelected?Theme.of(context).focusColor:AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          width: 2,
          color: Theme.of(context).focusColor
        )
      ),
      child: Row(
        children: [
          Icon(icon,color: isSelected?Theme.of(context).hintColor:Theme.of(context).primaryColorDark,),
          SizedBox(width: 0.02*width,),
          Text(title,style: isSelected?Theme.of(context).textTheme.headlineMedium:Theme.of(context).textTheme.headlineSmall,)
        ],
      ),
    );
  }
}