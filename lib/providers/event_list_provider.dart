import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/firebase_utils.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventListProvider extends ChangeNotifier{
  List<Event> eventsList=[];
  List<Event> filterEventsList=[];
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
}