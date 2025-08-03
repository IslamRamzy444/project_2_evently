import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/providers/user_provider.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';

class EventCardItem extends StatelessWidget {
  Event event;
  EventCardItem({super.key,required this.event});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var eventListProvider=Provider.of<EventListProvider>(context);
    var userProvider=Provider.of<UserProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Container(
      height: 0.35*height,
      padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.009*height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2,color: AppColors.primaryLight),
        image: DecorationImage(image: AssetImage(themeProvider.isDarkMode()?event.imageDark:event.imageLight,),fit: BoxFit.fill)
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
                IconButton(
                  onPressed: (){
                    eventListProvider.updateEventListFavStatus(event,userProvider.currentUser!.id,context);
                  }, 
                  icon: ImageIcon(AssetImage(
                    event.isFavorite==true?AppAssets.favoriteIconFilled:AppAssets.favoriteIcon
                    ),color: AppColors.primaryLight,))
              ],
            ),
          )
        ],
      ),
    );
  }
}