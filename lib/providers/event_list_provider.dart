import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/firebase_utils.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/dialog_utils.dart';
import 'package:project_2_evently/utils/toast_utils.dart';
import 'package:provider/provider.dart';
class EventListProvider extends ChangeNotifier{
  List<Event> eventsList=[];
  List<Event> filterEventsList=[];
  List<Event>  favoriteList=[];
  List<Map> itemsOfEvents=[];
  int selectedIndex=0;
  List<Map> getItemsOfEvents(BuildContext context){
    return itemsOfEvents=[
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
  }
  void getAllEvents(String uId) async{
    QuerySnapshot<Event> querySnapshot=await FirebaseUtils.getEventsCollection(uId).get();
    eventsList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    filterEventsList=eventsList;
    filterEventsList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    },);
    notifyListeners();
  }
  void getFilterEventsList(String uId,BuildContext context)async{
    var languageProvider=Provider.of<AppLanguageProvider>(context,listen: false);
    var querySnapshot=await FirebaseUtils.getEventsCollection(uId).orderBy('date_time').get();
    eventsList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    filterEventsList=eventsList.where((event) {
      return languageProvider.appLanguage=="en"?event.englishEventName==itemsOfEvents[selectedIndex]["name"]:event.arabicEventName==itemsOfEvents[selectedIndex]["name"];
    },).toList();
    notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex,String uId,BuildContext context){
    selectedIndex=newSelectedIndex;
    selectedIndex==0?getAllEvents(uId):getFilterEventsList(uId,context);
  }
  void updateEventListFavStatus(Event event,String uId,BuildContext context){
    FirebaseUtils.getEventsCollection(uId).doc(event.id).update({'is_favorite':!event.isFavorite}).then((value) {
      ToastUtils.showMsg(
        msg: "Event updated successfully", 
        backgroundColor: AppColors.greenColor, 
        textColor: AppColors.whiteColor
      );
      selectedIndex==0?getAllEvents(uId):getFilterEventsList(uId,context);
      getFavoriteList(uId);
      notifyListeners();
    },);
  }
  void getFavoriteList(String uId)async{
    var querySnapshot=await FirebaseUtils.getEventsCollection(uId).orderBy('date_time').get();
    favoriteList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    favoriteList=favoriteList.where((event) {
      return event.isFavorite==true;
    },).toList();
    notifyListeners();
  }
  Future<void> updateEventDetails({required Event event,required String uId,required BuildContext context}) async{
    await FirebaseUtils.getEventsCollection(uId).doc(event.id).update(event.toFireStore()).then((value) {
      selectedIndex==0?getAllEvents(uId):getFilterEventsList(uId,context);
      getFavoriteList(uId);
      ToastUtils.showMsg(
        msg: "Event updated successfully", 
        backgroundColor: AppColors.greenColor, 
        textColor: AppColors.whiteColor
      );
      notifyListeners();
    },).catchError((error){
      DialogUtils.showMessage(context: context, message: error.toString(),negActionName: "Ok",title: "Failure");
    });
  }
  void deleteEvent(Event event,String uId,BuildContext context){
    FirebaseUtils.getEventsCollection(uId).doc(event.id).delete().then((value) {
      ToastUtils.showMsg(
        msg: "Event deleted successfully", 
        backgroundColor: AppColors.redColor, 
        textColor: AppColors.whiteColor
      );
       selectedIndex==0?getAllEvents(uId):getFilterEventsList(uId,context);
       getFavoriteList(uId);
       notifyListeners();
    },);
  }
}