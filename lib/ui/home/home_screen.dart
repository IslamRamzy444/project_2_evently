import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/ui/home/tabs/favorites/favorites_tab.dart';
import 'package:project_2_evently/ui/home/tabs/home/home_tab.dart';
import 'package:project_2_evently/ui/home/tabs/map/map_tab.dart';
import 'package:project_2_evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget> tabs=[HomeTab(),MapTab(),FavoritesTab(),ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          
        },
        child: Icon(Icons.add,color: AppColors.whiteColor,size: 35,), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex=index;
          });
        },
        items: [
          myItem(
            index: 0, 
            selectedIcon: AppAssets.homeIconFilled, 
            unSelectedIcon: AppAssets.homeIcon, 
            label: AppLocalizations.of(context)!.home
          ),
          myItem(
            index: 1, 
            selectedIcon: AppAssets.mapIconFilled, 
            unSelectedIcon: AppAssets.mapIcon, 
            label: AppLocalizations.of(context)!.map
          ),
          myItem(
            index: 2, 
            selectedIcon: AppAssets.favoriteIconFilled, 
            unSelectedIcon: AppAssets.favoriteIcon, 
            label: AppLocalizations.of(context)!.love
          ),
          myItem(
            index: 3, 
            selectedIcon: AppAssets.profileIconFilled, 
            unSelectedIcon: AppAssets.profileIcon, 
            label: AppLocalizations.of(context)!.profile
          )
        ]
      ),
    );
  }
  BottomNavigationBarItem myItem({required int index,required String selectedIcon,required String unSelectedIcon,required String label}){
    return BottomNavigationBarItem(
      icon:index==selectedIndex?ImageIcon(AssetImage(selectedIcon)):ImageIcon(AssetImage(unSelectedIcon)),
      label: label
    );
  }
}