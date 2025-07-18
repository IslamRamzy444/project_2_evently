import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class EventCardItem extends StatelessWidget {
  Event event;
  EventCardItem({super.key,required this.event});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Container(
      height: 0.35*height,
      padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.009*height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2,color: AppColors.primaryLight),
        image: DecorationImage(image: AssetImage(event.image,),fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.001*height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).dividerColor
            ),
            child: Column(
              children: [
                Text("${event.dateTime.day}",style: AppStyles.boldPrimary20,),
                Text(DateFormat("MMM").format(event.dateTime),style: AppStyles.boldPrimary14,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.001*height),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(event.title,style: AppStyles.boldBlack14,)
                ),
                IconButton(onPressed: (){}, icon: ImageIcon(AssetImage(AppAssets.favoriteIcon),color: AppColors.primaryLight,))
              ],
            ),
          )
        ],
      ),
    );
  }
}