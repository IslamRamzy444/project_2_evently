import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/providers/user_provider.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:project_2_evently/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatefulWidget {
  EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Event? myEvent;
  @override
  Widget build(BuildContext context) {
    var event =myEvent??ModalRoute.of(context)!.settings.arguments as Event;
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var eventListProvider=Provider.of<EventListProvider>(context);
    var userProvider=Provider.of<UserProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: AppStyles.boldPrimary16,
        ),
        actions: [
          IconButton(
              onPressed: () async{
                var updatedEvent=await Navigator.pushNamed(context, AppRoutes.updateEventScreenRouteName,arguments: event) as Event?;
                if (updatedEvent!=null){
                  setState(() {
                    myEvent=updatedEvent;
                  });
                }
              },
              icon: ImageIcon(
                AssetImage(AppAssets.pencilEditingIcon),
                color: AppColors.primaryLight,
              )),
          IconButton(
              onPressed: () {
                DialogUtils.showMessage(
                  context: context, 
                  message: "Are you sure that you want to delete the event",
                  posActionName: "Ok",
                  posAction: (){
                    eventListProvider.deleteEvent(event,userProvider.currentUser!.id,context);
                    Navigator.pop(context);
                  },
                  negActionName:"Cancel" 
                );
              },
              icon: ImageIcon(
                AssetImage(AppAssets.trashDeletingIcon),
                color: AppColors.redColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(themeProvider.isDarkMode()?event.imageDark:event.imageLight),
              ),
              SizedBox(
                height: 0.019 * height,
              ),
              Text(
                event.title,
                style: AppStyles.mediumPrimary20.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 0.019 * height,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.02 * width, vertical: 0.01 * height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryLight)),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.03 * width, vertical: 0.015 * height),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight),
                    child: ImageIcon(
                      AssetImage(AppAssets.calendarIcon),
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 0.01 * width,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy').format(event.dateTime),
                        style: AppStyles.mediumPrimary16,
                      ),
                      Text(
                        event.time,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  )
                ]),
              ),
              SizedBox(
                height: 0.019 * height,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.02 * width, vertical: 0.01 * height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryLight)),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.03 * width, vertical: 0.015 * height),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight),
                    child: Icon(
                      Icons.my_location,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 0.01 * width,
                  ),
                  Text(
                    AppLocalizations.of(context)!.choose_event_location,
                    style: AppStyles.mediumPrimary16,
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryLight,
                      ))
                ]),
              ),
              SizedBox(
                height: 0.019 * height,
              ),
              Container(
                height: 0.4*height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight)
                ),
              ),
              SizedBox(
                height: 0.019 * height,
              ),
              Text(AppLocalizations.of(context)!.description,style:Theme.of(context).textTheme.bodyMedium,),
              SizedBox(
                height: 0.01* height,
              ),
              Text(event.description,style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ),
      ),
    );
  }
}
