import 'package:flutter/material.dart';
import 'package:project_2_evently/providers/app_language_provider.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/reusable_widgets/custom_elevated_button.dart';
import 'package:project_2_evently/reusable_widgets/custom_text_form_field.dart';
import 'package:project_2_evently/ui/auth/register/register_navigator.dart';
import 'package:project_2_evently/ui/auth/register/register_screen_view_model.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:project_2_evently/utils/dialog_utils.dart';
import 'package:provider/provider.dart';
import 'package:project_2_evently/l10n/app_localizations.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RegisterScreenViewModel viewModel=RegisterScreenViewModel();
  final _formKey = GlobalKey<FormState>();
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
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
              color: themeProvider.isDarkMode()
                  ? AppColors.primaryLight
                  : AppColors.blackColor2),
          title: Text(
            AppLocalizations.of(context)!.register,
            style: themeProvider.isDarkMode()
                ? AppStyles.boldPrimary16
                : AppStyles.boldPrimaryDark16,
          ),
        ),
        body: SingleChildScrollView(
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
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          controller: nameController,
                          borderSideColor: themeProvider.isDarkMode()
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                          hintText: AppLocalizations.of(context)!.name,
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return AppLocalizations.of(context)!
                                  .empty_name_error;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        CustomTextFormField(
                          controller: emailController,
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
                          controller: passwordController,
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
                        CustomTextFormField(
                          controller: rePasswordController,
                          obscureText: true,
                          borderSideColor: themeProvider.isDarkMode()
                              ? AppColors.primaryLight
                              : AppColors.greyColor,
                          hintText: AppLocalizations.of(context)!.re_password,
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
                                  .empty_re_password_error;
                            }
                            if (text.trim().length < 6) {
                              return AppLocalizations.of(context)!
                                  .short_re_password_error;
                            }
                            if (passwordController.text.trim() != text.trim()) {
                              return AppLocalizations.of(context)!
                                  .re_password_matching_error;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              register();
                            },
                            butTitle:
                                AppLocalizations.of(context)!.create_account),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.already_have_account,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
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

  void register() async {
    if (_formKey.currentState!.validate() == true) {
      viewModel.register(emailController.text, passwordController.text);
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
