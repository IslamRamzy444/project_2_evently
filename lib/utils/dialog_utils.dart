import 'package:flutter/material.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';

class DialogUtils {
  static void showLoading({required BuildContext context,required String loadingText}){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.primaryLight,),
            Text(loadingText,style: AppStyles.boldPrimary16,)
          ],
        ),
      ),
    );
  }
  static void removeLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  static void showMessage({required BuildContext context,String? title,required String message,String? posActionName,Function? posAction,String? negActionName,Function? negAction}){
    List<Widget>? actions=[];
    if(posActionName!=null){
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          posAction?.call();
        }, 
        child: Text(posActionName,style: AppStyles.boldPrimaryDark16,)
      )
      );
    }
    if(negActionName!=null){
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          negAction?.call();
        }, 
        child: Text(negActionName,style: AppStyles.boldPrimaryDark16,)
      )
      );
    }
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title?? '',style: AppStyles.boldPrimaryDark16,),
        content: Text(message,style: AppStyles.boldBlack14,),
        actions: actions,
      ),
    );
  }
}