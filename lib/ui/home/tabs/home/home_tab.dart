import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_card_item.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_tab_item.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  
  @override
  Widget build(BuildContext context) {
    var eventListProvider=Provider.of<EventListProvider>(context);
    eventListProvider.getItemsOfEvents(context);
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    if(eventListProvider.eventsList.isEmpty){
      eventListProvider.getAllEvents();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.welcome_back,style: AppStyles.regularWhite14,),
                Text("Route",style: AppStyles.boldWhite24,)
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.wb_sunny_outlined,color: AppColors.whiteColor,)),
            Container(
              margin: EdgeInsets.only(left: 0.02*width),
              padding: EdgeInsets.symmetric(vertical: 0.009*height,horizontal: 0.02*width),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(AppLocalizations.of(context)!.en,style: AppStyles.boldPrimary14,),
            )
          ],
        ),
        bottom: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 0.15*height,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Image.asset(AppAssets.mapIcon)
                  ),
                  SizedBox(width: 0.02*width,),
                  Text("Cairo , Egypt",style: AppStyles.mediumWhite14,)
                ],
              ),
              DefaultTabController(
                initialIndex: eventListProvider.selectedIndex,
                length: eventListProvider.itemsOfEvents.length, 
                child: TabBar(
                  onTap: (index) {
                    eventListProvider.changeSelectedIndex(index);
                  },
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  tabs: eventListProvider.itemsOfEvents.map((event) {
                    return EventTabItem(
                      title: event["name"], 
                      icon: event["icon"], 
                      isSelected: eventListProvider.selectedIndex==event["index"],
                      selectedBgColor: Theme.of(context).focusColor,
                      selectedStyle: Theme.of(context).textTheme.headlineMedium!,
                      unSelectedStyle: AppStyles.mediumWhite16,
                      selectedIconColor: Theme.of(context).hintColor,
                      unSelectedIconColor: AppColors.whiteColor,
                    );
                  },).toList()
                )
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04*width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child:eventListProvider.filterEventsList.isEmpty? Center(
                child:Text(AppLocalizations.of(context)!.no_events_added_yet,
                style: Theme.of(context).textTheme.bodyMedium,) ,)
              :ListView.separated(
                padding: EdgeInsets.only(top: 0.019*height),
                itemBuilder: (context, index) {
                  return EventCardItem(event: eventListProvider.filterEventsList[index],);
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(height: 0.019*height,);
                }, 
                itemCount: eventListProvider.filterEventsList.length
              )
            )
          ],
        ),
      ),
    );
  }
}