import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme=ThemeMode.light;
  AppThemeProvider(){
    fetchMyCurrentTheme();
  }
  void changeAppTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme=newTheme;
    saveCurrentTheme();
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme==ThemeMode.dark;
  }
  Future<void> fetchMyCurrentTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark=prefs.getBool('theme-mode')??false;
    if(isDark){
      appTheme=ThemeMode.dark;
    }else{
      appTheme=ThemeMode.light;
    }
    notifyListeners();
  }
  Future<void> saveCurrentTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme-mode', appTheme==ThemeMode.dark);
  }
}