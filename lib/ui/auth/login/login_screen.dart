import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_2_evently/firebase_utils.dart';
import 'package:project_2_evently/models/my_user.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/providers/user_provider.dart';
import 'package:project_2_evently/reusable_widgets/custom_elevated_button.dart';
import 'package:project_2_evently/reusable_widgets/custom_text_form_field.dart';
import 'package:project_2_evently/ui/auth/login/login_navigator.dart';
import 'package:project_2_evently/ui/auth/login/login_screen_view_model.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_routes.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:project_2_evently/utils/dialog_utils.dart';
import 'package:provider/provider.dart';
import 'package:project_2_evently/l10n/app_localizations.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator{
  LoginScreenViewModel viewModel=LoginScreenViewModel();
  int selectedLanguageIndex = 0;
  late AppLanguageProvider languageProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    languageProvider = Provider.of<AppLanguageProvider>(context);
    selectedLanguageIndex = languageProvider.appLanguage == "en" ? 0 : 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.eventlyLogo2,
                  height: 0.22 * height,
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          controller: viewModel.emailController,
                          borderSideColor: themeProvider.isDarkMode()
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                          hintText: AppLocalizations.of(context)!.email,
                          keyBoardType: TextInputType.emailAddress,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .empty_email_error;
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text.trim());
                            if (!emailValid) {
                              return AppLocalizations.of(context)!
                                  .invalid_email_error;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        CustomTextFormField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          borderSideColor: themeProvider.isDarkMode()
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                          hintText: AppLocalizations.of(context)!.password,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .empty_password_error;
                            }
                            if (text.trim().length < 6) {
                              return AppLocalizations.of(context)!
                                  .short_password_error;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppLocalizations.of(context)!.forget_password,
                                style: AppStyles.boldPrimary16.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryLight),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.login();
                            },
                            butTitle: AppLocalizations.of(context)!.login),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.do_not_have_account,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.registerScreenRouteName);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.create_account,
                                style: AppStyles.mediumPrimary16.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryLight),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              color: AppColors.primaryLight,
                              indent: 0.07 * width,
                              endIndent: 0.04 * width,
                            )),
                            Text(
                              AppLocalizations.of(context)!.or,
                              style: AppStyles.mediumPrimary16,
                            ),
                            Expanded(
                                child: Divider(
                              color: AppColors.primaryLight,
                              indent: 0.04 * width,
                              endIndent: 0.07 * width,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            backgroundColor: AppColors.transparentColor,
                            borderSideColor: AppColors.primaryLight,
                            hasIcon: true,
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage(AppAssets.googleLogo)),
                                SizedBox(
                                  width: 0.015 * width,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .login_with_google,
                                  style: AppStyles.mediumPrimary20,
                                )
                              ],
                            ),
                            butTitle:
                                AppLocalizations.of(context)!.login_with_google)
                      ],
                    )),
                SizedBox(
                  height: 0.03 * height,
                ),
                ToggleSwitch(
                  initialLabelIndex: selectedLanguageIndex,
                  totalSwitches: 2,
                  activeBgColor: [Theme.of(context).dividerColor],
                  inactiveBgColor: Theme.of(context).dividerColor,
                  borderColor: [AppColors.primaryLight],
                  borderWidth: 1,
                  minWidth: 0.1 * width,
                  cornerRadius: 20,
                  customWidgets: [
                    buildMyFlagIcon(
                        flagName: AppAssets.usFlag,
                        isActive: selectedLanguageIndex == 0),
                    buildMyFlagIcon(
                        flagName: AppAssets.egFlag,
                        isActive: selectedLanguageIndex == 1)
                  ],
                  onToggle: (index) {
                    changeLanguage(index!);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void signInWithGoogle()async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
      var firebaseAuthUser=userCredential.user;
      if(firebaseAuthUser==null){
        return;
      }
      String userId=firebaseAuthUser.uid;
      MyUser myUser=MyUser(id: userId, name: firebaseAuthUser.displayName??'', email: firebaseAuthUser.email??'');
      await FirebaseUtils.addUserToFireStore(myUser);
      var userProvider=Provider.of<UserProvider>(context,listen: false);
      userProvider.updateCurrentUser(myUser);
      var eventListProvider=Provider.of<EventListProvider>(context,listen: false);
      eventListProvider.changeSelectedIndex(0, userProvider.currentUser!.id,context);
      eventListProvider.getFavoriteList(userProvider.currentUser!.id);
      DialogUtils.showMessage(
        context: context,
        title: "Success", 
        message: "User logged in successfully",
        posActionName: "Ok",
        posAction:(){
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRouteName);
        }
      );
    }on FirebaseAuthException catch(e){
      DialogUtils.showMessage(
        context: context,
        title: "Failure", 
        message: e.toString(),
        negActionName: "Ok"
      );
    }
  }

  Widget buildMyFlagIcon({required String flagName, required bool isActive}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: AppColors.primaryLight, width: 2)
            : null,
      ),
      child: ClipOval(
        child: Image.asset(
          flagName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void changeLanguage(int index) {
    setState(() {
      selectedLanguageIndex = index;
    });
    if (index == 0) {
      languageProvider.changeLanguage('en');
    } else {
      languageProvider.changeLanguage('ar');
    }
  }
  
  @override
  void hideLoading() {
    DialogUtils.removeLoading(context: context);
  }
  
  @override
  void showLoadingMessage(String message) {
    DialogUtils.showLoading(context: context, loadingText: message);
  }
  
  @override
  void showMessage(String message) {
    DialogUtils.showMessage(context: context, message: message,posActionName: "Ok");
  }
}
