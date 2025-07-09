import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_2_evently/ui/intro/reusable_widgets/my_custom_button.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:project_2_evently/utils/app_styles.dart';
class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  late var pageDecoration;
  late var width;
  late var height;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.sizeOf(context).width;
    height=MediaQuery.sizeOf(context).height;
    pageDecoration=PageDecoration(
      imageFlex: 4,
      bodyFlex: 2,
      titlePadding: EdgeInsets.zero,
    );
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          showBackButton: true,
          next: MyCustomButton(icon: Icons.arrow_forward),
          back: MyCustomButton(icon: Icons.arrow_back),
          done: MyCustomButton(icon: Icons.arrow_forward),
          onDone: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRouteName);
          },
          dotsDecorator: DotsDecorator(
            size: Size.fromRadius(0.01*height),
            activeSize: Size(width*0.05, height*0.02),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            activeColor: AppColors.primaryLight,
            color: Theme.of(context).primaryColorLight,
            spacing: EdgeInsets.symmetric(horizontal: 0.007*width)
          ),
          pages: [
            myPage(
              image:AppAssets.introImage2, 
              title: AppLocalizations.of(context)!.intro_title_two_one, 
              content: AppLocalizations.of(context)!.intro_content_two_one
            ),
            myPage(
              image:AppAssets.introImage3, 
              title: AppLocalizations.of(context)!.intro_title_three_one, 
              content: AppLocalizations.of(context)!.intro_content_three_one
            ),
            myPage(
              image:AppAssets.introImage4, 
              title: AppLocalizations.of(context)!.intro_title_four_one, 
              content: AppLocalizations.of(context)!.intro_content_four_one
            )
          ],
        ),
      ),
    );
  }
  PageViewModel myPage({required String image,required String title,required String content}){
    return PageViewModel(
      image: Column(
        children: [
          Image.asset(AppAssets.eventlyLogo1),
          SizedBox(height: 0.02*height,),
          SizedBox(
            width: 0.92*width,
            height: 0.48*width,
            child: Image.asset(image,fit: BoxFit.fill,),
          ),
        ],
      ),
      titleWidget: Text(""),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppStyles.boldPrimary20,),
          SizedBox(height: 0.04*height,),
          Text(content,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
      decoration: pageDecoration
    );
  }
}