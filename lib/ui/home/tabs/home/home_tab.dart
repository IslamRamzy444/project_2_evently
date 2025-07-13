import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_card_item.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_tab_item.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    List events=[
       {
        "index":0,
        "name":AppLocalizations.of(context)!.all,
        "icon":CupertinoIcons.compass
       },
       {
        "index":1,
        "name":AppLocalizations.of(context)!.sport,
        "icon":Icons.directions_bike_outlined
       },
       {
        "index":2,
        "name":AppLocalizations.of(context)!.birthday,
        "icon":Icons.cake_outlined
       },
       {
        "index":3,
        "name":AppLocalizations.of(context)!.meeting,
        "icon":Icons.meeting_room_outlined
       },
       {
        "index":4,
        "name":AppLocalizations.of(context)!.gaming,
        "icon":Icons.games
       },
       {
        "index":5,
        "name":AppLocalizations.of(context)!.workshop,
        "icon":Icons.workspaces
       },
       {
        "index":6,
        "name":AppLocalizations.of(context)!.book_club,
        "icon":Icons.menu_book
       },
       {
        "index":7,
        "name":AppLocalizations.of(context)!.exhibition,
        "icon":Icons.museum_outlined
       },
       {
        "index":8,
        "name":AppLocalizations.of(context)!.holiday,
        "icon":Icons.holiday_village_outlined
       },
       {
        "index":9,
        "name":AppLocalizations.of(context)!.eating,
        "icon":Icons.restaurant
       },
    ];
    return Scaffold(
      appBar: AppBar(
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
                initialIndex: selectedIndex,
                length: events.length, 
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  tabs: events.map((event) {
                    return EventTabItem(
                      title: event["name"], 
                      icon: event["icon"], 
                      isSelected: selectedIndex==event["index"]
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
              child: ListView.separated(
                padding: EdgeInsets.only(top: 0.019*height),
                itemBuilder: (context, index) {
                  return EventCardItem();
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(height: 0.019*height,);
                }, 
                itemCount: 20
              )
            )
          ],
        ),
      ),
    );
  }
}