import 'package:flutter/material.dart';
import 'package:project_2_evently/reusable_widgets/custom_text_form_field.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_card_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
class FavoritesTab extends StatelessWidget {
  FavoritesTab({super.key});
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
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
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 0.019 * height),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 0.3*height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primaryLight)
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 0.019 * height,
                      );
                    },
                    itemCount: 20))
          ],
        ),
      ),
    ));
  }
}
