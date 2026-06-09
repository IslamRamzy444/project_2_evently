import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/ui/auth/register/register_navigator.dart';

class RegisterScreenViewModel extends ChangeNotifier{
  late RegisterNavigator navigator;
  void register(String email,String password)async{
    navigator.showLoadingMessage("Loading ...");
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // MyUser myUser=MyUser(id: credential.user?.uid ??'' ,name: nameController.text,email: emailController.text);
        // await FirebaseUtils.addUserToFireStore(myUser);
        // var userProvider=Provider.of<UserProvider>(context,listen: false);
        // userProvider.updateCurrentUser(myUser);
        // var eventListProvider=Provider.of<EventListProvider>(context,listen: false);
        // eventListProvider.changeSelectedIndex(0, userProvider.currentUser!.id,context);
        navigator.hideLoading();
        navigator.showMessage("User created successfully");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          navigator.hideLoading();
          navigator.showMessage('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          navigator.hideLoading();
          navigator.showMessage('The account already exists for that email.');
        }
      } catch (e) {
        navigator.hideLoading();
        navigator.showMessage(e.toString());
      }
  }
}