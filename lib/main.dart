import 'package:flutter/material.dart';
import 'package:project_2_evently/ui/home/home_screen.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.homeScreenRouteName:(context)=>HomeScreen()
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}