import 'package:flutter/material.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/ui/home/tabs/profile/language/language_bottom_sheet.dart';
import 'package:project_2_evently/ui/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.25*height,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.02*width),
          child: Padding(
            padding: EdgeInsets.only(bottom: 0.02*height,top: 0.02*height),
            child: Row(
              children: [
                Image.asset(AppAssets.routeLogo),
                SizedBox(width: 0.02*width,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Route",style: AppStyles.boldWhite24,),
                    Text("johnsafwat.route@gmail.com",style: AppStyles.mediumWhite16,)
                  ],
                )
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45))
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.03*height,horizontal: 0.04*width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(
              height: 0.01*height,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.015*height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1,color: AppColors.primaryLight)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageProvider.appLanguage=="en"?
                    AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic,
                    style: AppStyles.boldPrimary20,
                  ),
                  IconButton(onPressed: (){showLanguageBottomSheet();}, icon: Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryLight,size: 30,))
                ],
              ),
            ),
            SizedBox(
              height: 0.01*height,
            ),
            Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(
              height: 0.01*height,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.04*width,vertical: 0.015*height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1,color: AppColors.primaryLight)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    themeProvider.appTheme==ThemeMode.light?
                    AppLocalizations.of(context)!.light:
                    AppLocalizations.of(context)!.dark,
                    style: AppStyles.boldPrimary20,
                  ),
                  IconButton(onPressed: (){showThemeBottomSheet();}, icon: Icon(Icons.arrow_drop_down_outlined,color: AppColors.primaryLight,size: 30,))
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 0.05*width,vertical: 0.025*height),
                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              onPressed: () {
                
              }, 
              child: Row(
                children: [
                  Icon(Icons.logout,color: AppColors.whiteColor,),
                  SizedBox(width: 0.02*width,),
                  Text(AppLocalizations.of(context)!.logout,style:AppStyles.regularWhite20 ,)
                ],
              )
            ),
            SizedBox(height: 0.025*height,)
          ],
        ),
      ),
    );
  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) => LanguageBottomSheet(),
    );
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) => ThemeBottomSheet(),
    );
  }
}