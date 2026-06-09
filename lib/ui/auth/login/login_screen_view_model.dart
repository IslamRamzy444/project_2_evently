import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/ui/auth/login/login_navigator.dart';

class LoginScreenViewModel extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late LoginNavigator navigator;
  void login() async {
    if (formKey.currentState!.validate()) {
      navigator.showLoadingMessage("Loading ...");
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        // var user=await FirebaseUtils.readUserFromFirestore(credential.user?.uid??'');
        // if(user==null){
        //   return;
        // }
        // var userProvider=Provider.of<UserProvider>(context,listen: false);
        // userProvider.updateCurrentUser(user);
        // var eventListProvider=Provider.of<EventListProvider>(context,listen: false);
        // eventListProvider.changeSelectedIndex(0, userProvider.currentUser!.id,context);
        // eventListProvider.getFavoriteList(userProvider.currentUser!.id);
        navigator.hideLoading();
        navigator.showMessage("User logged in successfully");                
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          navigator.hideLoading();
          navigator.showMessage('Invalid login credentials.');
        } else {
          navigator.hideLoading();
          navigator.showMessage(e.code);
        }
      }
    }
  }
}