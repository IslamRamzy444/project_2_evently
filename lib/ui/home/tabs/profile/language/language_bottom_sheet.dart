import 'package:flutter/material.dart';
import 'package:project_2_evently/l10n/app_localizations.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.03*width,vertical: 0.02*height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage("en");
            },
            child: languageProvider.appLanguage=="en"?
            selectedLanguageItem(itemName: AppLocalizations.of(context)!.english):
            unselectedLanguageItem(itemName: AppLocalizations.of(context)!.english),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage("ar");
            },
            child: languageProvider.appLanguage=="ar"?
            selectedLanguageItem(itemName: AppLocalizations.of(context)!.arabic):
            unselectedLanguageItem(itemName: AppLocalizations.of(context)!.arabic)
          )
        ],
      ),
    );
  }
  Widget selectedLanguageItem({required String itemName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName,style: AppStyles.boldPrimary20,),
        Icon(Icons.check,color: AppColors.primaryLight,)
      ],
    );
  }
  Widget unselectedLanguageItem({required String itemName}){
    return Text(itemName,style: AppStyles.boldBlack20,); 
  }
}