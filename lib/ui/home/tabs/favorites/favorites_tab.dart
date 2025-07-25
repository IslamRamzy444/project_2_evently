import 'package:flutter/material.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/providers/user_provider.dart';
import 'package:project_2_evently/reusable_widgets/custom_text_form_field.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_card_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';
class FavoritesTab extends StatefulWidget {
  FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  TextEditingController searchController=TextEditingController();
  late UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var eventListProvider=Provider.of<EventListProvider>(context);
    userProvider=Provider.of<UserProvider>(context);
    if(eventListProvider.favoriteList.isEmpty){
      eventListProvider.getFavoriteList(userProvider.currentUser!.id);
    }
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0.02*height,),
            CustomTextFormField(
              controller: searchController,
              borderSideColor: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyles.boldPrimary14,
              prefixIcon: Icon(Icons.search,color: AppColors.primaryLight,),
              cursorColor: AppColors.primaryLight,
              inputStyle: AppStyles.boldPrimary14,
            ),
            Expanded(
                child:eventListProvider.favoriteList.isEmpty?
                Center(child: Text(AppLocalizations.of(context)!.no_fav_found,style: Theme.of(context).textTheme.bodyMedium,),) 
                :ListView.separated(
                    padding: EdgeInsets.only(top: 0.019 * height),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.eventDetailsScreenRouteName,arguments: eventListProvider.favoriteList[index]);
                        },
                        child: EventCardItem(event: eventListProvider.favoriteList[index])
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 0.019 * height,
                      );
                    },
                    itemCount: eventListProvider.favoriteList.length))
          ],
        ),
      ),
    ));
  }
}
