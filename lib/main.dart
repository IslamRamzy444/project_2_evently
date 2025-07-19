import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_2_evently/firebase_options.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/ui/auth/login/login_screen.dart';
import 'package:project_2_evently/ui/home/home_screen.dart';
import 'package:project_2_evently/ui/home/tabs/home/add_event/add_event.dart';
import 'package:project_2_evently/ui/intro/intro_screen1.dart';
import 'package:project_2_evently/ui/intro/intro_screen2.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_theme.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
      ChangeNotifierProvider(create: (context) => EventListProvider(),)
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introScreen1RouteName,
      routes: {
        AppRoutes.introScreen1RouteName:(context)=>IntroScreen1(),
        AppRoutes.introScreen2RouteName:(context)=>IntroScreen2(),
        AppRoutes.homeScreenRouteName:(context)=>HomeScreen(),
        AppRoutes.addEventScreenRouteName:(context)=>AddEvent(),
        AppRoutes.loginScreenRouteName:(context)=>LoginScreen()
      },
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}