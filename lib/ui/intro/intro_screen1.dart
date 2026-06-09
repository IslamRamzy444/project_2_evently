import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({super.key});

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  late var width;
  late var height;
  late AppLanguageProvider languageProvider;
  late AppThemeProvider themeProvider;
  int selectedLanguageIndex=0;
  int selectedThemeIndex=0;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.sizeOf(context).width;
    height=MediaQuery.sizeOf(context).height;
    languageProvider=Provider.of<AppLanguageProvider>(context);
    themeProvider=Provider.of<AppThemeProvider>(context);
    selectedLanguageIndex=languageProvider.appLanguage=="en"?0:1;
    selectedThemeIndex=themeProvider.isDarkMode()?1:0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 0.04*width,right: 0.04*width,bottom: 0.04*height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Image.asset(AppAssets.eventlyLogo1)),
                SizedBox(
                  width: 0.92*width,
                  height: 0.45*height,
                  child: Image.asset(AppAssets.introImage1,fit: BoxFit.fill,)
                ),
                Text(AppLocalizations.of(context)!.intro_title_one,style:AppStyles.boldPrimary20,),
                SizedBox(height:0.015*height),
                Text(AppLocalizations.of(context)!.intro_content_one,style:Theme.of(context).textTheme.bodyMedium,),
                SizedBox(height:0.01*height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.language,style: AppStyles.mediumPrimary20,),
                    ToggleSwitch(
                      initialLabelIndex: selectedLanguageIndex,
                      totalSwitches: 2,
                      activeBgColor: [Theme.of(context).dividerColor],
                      inactiveBgColor: Theme.of(context).dividerColor,
                      borderColor: [AppColors.primaryLight],
                      borderWidth: 1,
                      minWidth: 0.1*width,
                      cornerRadius: 20,
                      customWidgets: [
                        buildMyFlagIcon(flagName: AppAssets.usFlag,isActive: selectedLanguageIndex==0),
                        buildMyFlagIcon(flagName: AppAssets.egFlag,isActive: selectedLanguageIndex==1)
                      ],
                      onToggle: (index) {
                        changeLanguage(index!);
                      },
                    )
                  ],
                ),
                SizedBox(height: 0.01*height,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.theme,style: AppStyles.mediumPrimary20,),
                    ToggleSwitch(
                      initialLabelIndex: selectedThemeIndex,
                      totalSwitches: 2,
                      activeBgColor: [Theme.of(context).dividerColor],
                      inactiveBgColor: Theme.of(context).dividerColor,
                      borderColor: [AppColors.primaryLight],
                      borderWidth: 1,
                      minWidth: 0.1*width,
                      cornerRadius: 0.1*width,
                      customWidgets: [
                        buildMyThemeIcon(index: 0, isActive: selectedThemeIndex==0),
                        buildMyThemeIcon(index: 1, isActive: selectedThemeIndex==1)
                      ],
                      onToggle: (index) {
                        changeTheme(index!);
                      },
                    )
                  ],
                ),
                SizedBox(height:0.02*height),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLight,
                    padding: EdgeInsets.symmetric(vertical: 0.025*height),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.introScreen2RouteName);
                  }, 
                  child: Text(AppLocalizations.of(context)!.intro_but_title_1,style: AppStyles.mediumWhite20,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildMyFlagIcon({required String flagName,required bool isActive}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isActive?Border.all(color: AppColors.primaryLight,width: 2):null,
      ),
      child: ClipOval(
        child: Image.asset(flagName,fit:BoxFit.cover,),
      ),
    );
  }
  Widget buildMyThemeIcon({required int index,required bool isActive}){
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: isActive?AppColors.primaryLight:Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(0.1*width)
      ),
      child: index==0 && isActive?
      Icon(Icons.wb_sunny_outlined, color:Theme.of(context).dividerColor,size: 12,):
      index==0 && !(isActive)?
      Icon(Icons.sunny,color:AppColors.primaryLight,size: 12,):
      index==1 && !(isActive)?
      FaIcon(FontAwesome.moon_solid,color: AppColors.primaryLight,size: 12,):
      Icon(FontAwesome.moon,size: 12,),
    );
  }
  void changeLanguage(int index){
    setState(() {
      selectedLanguageIndex=index;
    });
    if(index==0){
      languageProvider.changeLanguage('en');
    }else{
      languageProvider.changeLanguage('ar');
    }
  }
  void changeTheme(int index){
    setState(() {
      selectedThemeIndex=index;
    });
    if(index==0){
      themeProvider.changeAppTheme(ThemeMode.light);
    }else{
      themeProvider.changeAppTheme(ThemeMode.dark);
    }
  }
}