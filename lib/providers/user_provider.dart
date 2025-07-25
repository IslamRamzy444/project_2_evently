import 'package:flutter/material.dart';
import 'package:project_2_evently/models/my_user.dart';

class UserProvider extends ChangeNotifier{
  MyUser? currentUser;
  void updateCurrentUser(MyUser newUser){
    currentUser=newUser;
    notifyListeners();
  }
}