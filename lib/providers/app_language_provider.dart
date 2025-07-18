import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier{
  String appLanguage="en";
  AppLanguageProvider(){
    fetchMyCurrentAppLang();
  }
  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    saveAppLang();
    notifyListeners();
  }
  Future<void> fetchMyCurrentAppLang()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String appLang=prefs.getString('app-language')??"en";
    if(appLang=="en"){
      appLanguage="en";
    }else{
      appLanguage="ar";
    }
    notifyListeners();
  }
  Future<void> saveAppLang()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('app-language', appLanguage);
  }
}