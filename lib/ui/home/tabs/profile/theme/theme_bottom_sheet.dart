import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';
class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.03*width,vertical: 0.02*height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.light);
            },
            child: !(themeProvider.isDarkMode())?
            selectedThemeItem(itemName: AppLocalizations.of(context)!.light):
            unselectedThemeItem(itemName: AppLocalizations.of(context)!.light),
          ),
          InkWell(
            onTap: () {
              themeProvider.changeAppTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()?
            selectedThemeItem(itemName: AppLocalizations.of(context)!.dark):
            unselectedThemeItem(itemName: AppLocalizations.of(context)!.dark)
          )
        ],
      ),
    );
  }
  Widget selectedThemeItem({required String itemName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(itemName,style: AppStyles.boldPrimary20,),
        Icon(Icons.check,color: AppColors.primaryLight,)
      ],
    );
  }
  Widget unselectedThemeItem({required String itemName}){
    return Text(itemName,style: AppStyles.boldBlack20,);
  }
}