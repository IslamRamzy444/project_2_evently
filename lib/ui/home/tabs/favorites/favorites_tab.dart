import 'package:flutter/material.dart';
import 'package:project_2_evently/ui/home/tabs/favorites/reusable_widgets/custom_text_field.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_card_item.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 0.019 * height),
                    itemBuilder: (context, index) {
                      return EventCardItem();
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
