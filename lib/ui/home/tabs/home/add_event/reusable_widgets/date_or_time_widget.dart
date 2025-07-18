import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class DateOrTimeWidget extends StatelessWidget {
  String iconDateOrTimeName;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTimePressed;
  DateOrTimeWidget({super.key,required this.iconDateOrTimeName,required this.eventDateOrTime,required this.chooseDateOrTime,required this.onChooseDateOrTimePressed});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Image.asset(iconDateOrTimeName,color: Theme.of(context).secondaryHeaderColor,),
        SizedBox(width: 0.02*width,),
        Text(eventDateOrTime,style: Theme.of(context).textTheme.bodyMedium,),
        Spacer(),
        TextButton(
          onPressed: onChooseDateOrTimePressed, 
          child: Text(chooseDateOrTime,style: AppStyles.boldPrimary16,)
        )
      ],
    );
  }
}