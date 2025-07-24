import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/firebase_utils.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/toast_utils.dart';
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
  void getAllEvents() async{
    QuerySnapshot<Event> querySnapshot=await FirebaseUtils.getEventsCollection().get();
    eventsList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    filterEventsList=eventsList;
    filterEventsList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    },);
    notifyListeners();
  }
  void getFilterEventsList()async{
    var querySnapshot=await FirebaseUtils.getEventsCollection().where('event_name',isEqualTo:itemsOfEvents[selectedIndex]["name"]).orderBy('date_time').get();
    filterEventsList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex==0?getAllEvents():getFilterEventsList();
  }
  void updateEventListFavStatus(Event event){
    FirebaseUtils.getEventsCollection().doc(event.id).update({'is_favorite':!event.isFavorite}).timeout(Duration(milliseconds: 500),
    onTimeout: () {
      ToastUtils.showMsg(
        msg: "Event updated successfully", 
        backgroundColor: AppColors.greenColor, 
        textColor: AppColors.whiteColor
      );
    },);
    selectedIndex==0?getAllEvents():getFilterEventsList();
    getFavoriteList();
    notifyListeners();
  }
  void getFavoriteList()async{
    var querySnapshot=await FirebaseUtils.getEventsCollection().orderBy('date_time').where('is_favorite',isEqualTo: true).get();
    favoriteList=querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    notifyListeners();
  }
  void updateEventDetails({required Event event,required String image,required String title,required String description,required String eventName,required DateTime eventDate,required String eventTime}){
    FirebaseUtils.getEventsCollection().doc(event.id).update({
      'image':image,
      'title':title,
      'description':description,
      'event_name':eventName,
      'date_time':eventDate,
      'time':eventTime
    }).timeout(Duration(milliseconds: 500),onTimeout: () {
      ToastUtils.showMsg(
        msg: "Event updated successfully", 
        backgroundColor: AppColors.greenColor, 
        textColor: AppColors.whiteColor
      );
    },);
    getAllEvents();
    getFavoriteList();
    notifyListeners();
  }
  void deleteEvent(Event event){
    FirebaseUtils.getEventsCollection().doc(event.id).delete().timeout((Duration(milliseconds: 500)),onTimeout: () {
      ToastUtils.showMsg(
        msg: "Event deleted successfully", 
        backgroundColor: AppColors.redColor, 
        textColor: AppColors.whiteColor
      );
    },);
    selectedIndex==0?getAllEvents():getFilterEventsList();
    getFavoriteList();
    notifyListeners();
  }
}