import 'package:flutter/material.dart';
import 'package:project_2_evently/ui/home/home_screen.dart';
import 'package:project_2_evently/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.homeScreenRouteName:(context)=>HomeScreen()
      },
    );
  }
}