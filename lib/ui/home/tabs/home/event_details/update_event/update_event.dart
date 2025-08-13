import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:project_2_evently/providers/app_theme_provider.dart';
import 'package:project_2_evently/providers/event_list_provider.dart';
import 'package:project_2_evently/providers/user_provider.dart';
import 'package:project_2_evently/reusable_widgets/custom_elevated_button.dart';
import 'package:project_2_evently/reusable_widgets/custom_text_form_field.dart';
import 'package:project_2_evently/ui/home/tabs/home/add_event/reusable_widgets/date_or_time_widget.dart';
import 'package:project_2_evently/ui/home/tabs/home/reusable_widgets/event_tab_item.dart';
import 'package:project_2_evently/utils/app_assets.dart';
import 'package:project_2_evently/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_2_evently/utils/app_styles.dart';
import 'package:provider/provider.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  late Event event;
  final _formKey = GlobalKey<FormState>();
  late EventListProvider eventListProvider;
  late UserProvider userProvider;
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  String englishEventName='';
  String arabicEventName='';
  String selectedImage='';
  String lightImage='';
  String darkImage='';
  String? formattedDate;
  TimeOfDay? selectedTime;
  String? formattedTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    titleController.text = event.title;
    descriptionController.text = event.description;
  });
  }
  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context)!.settings.arguments as Event;
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventListProvider=Provider.of<EventListProvider>(context);
    userProvider=Provider.of<UserProvider>(context);
    List events = [
      {
        "index": 0,
        "name": AppLocalizations.of(context)!.sport,
        "name_en":AppLocalizations.of(context)!.sport_en,
        "name_ar":AppLocalizations.of(context)!.sport_ar,
        "icon": Icons.directions_bike_outlined
      },
      {
        "index": 1,
        "name": AppLocalizations.of(context)!.birthday,
        "name_en":AppLocalizations.of(context)!.birthday_en,
        "name_ar":AppLocalizations.of(context)!.birthday_ar,
        "icon": Icons.cake_outlined
      },
      {
        "index": 2,
        "name": AppLocalizations.of(context)!.meeting,
        "name_en":AppLocalizations.of(context)!.meeting_en,
        "name_ar":AppLocalizations.of(context)!.meeting_ar,
        "icon": Icons.meeting_room_outlined
      },
      {
        "index": 3,
        "name": AppLocalizations.of(context)!.gaming,
        "name_en":AppLocalizations.of(context)!.gaming_en,
        "name_ar":AppLocalizations.of(context)!.gaming_ar,
        "icon": Icons.games
      },
      {
        "index": 4,
        "name": AppLocalizations.of(context)!.workshop,
        "name_en":AppLocalizations.of(context)!.workshop_en,
        "name_ar":AppLocalizations.of(context)!.workshop_ar,
        "icon": Icons.workspaces
      },
      {
        "index": 5,
        "name": AppLocalizations.of(context)!.book_club,
        "name_en":AppLocalizations.of(context)!.book_club_en,
        "name_ar":AppLocalizations.of(context)!.book_club_ar,
        "icon": Icons.menu_book
      },
      {
        "index": 6,
        "name": AppLocalizations.of(context)!.exhibition,
        "name_en":AppLocalizations.of(context)!.exhibition_en,
        "name_ar":AppLocalizations.of(context)!.exhibition_ar,
        "icon": Icons.museum_outlined
      },
      {
        "index": 7,
        "name": AppLocalizations.of(context)!.holiday,
        "name_en":AppLocalizations.of(context)!.holiday_en,
        "name_ar":AppLocalizations.of(context)!.holiday_ar,
        "icon": Icons.holiday_village_outlined
      },
      {
        "index": 8,
        "name": AppLocalizations.of(context)!.eating,
        "name_en":AppLocalizations.of(context)!.eating_en,
        "name_ar":AppLocalizations.of(context)!.eating_ar,
        "icon": Icons.restaurant
      },
    ];
    List<String> eventImagesList = [
      AppAssets.sportImageLight,
      AppAssets.birthdayImageLight,
      AppAssets.meetingImageLight,
      AppAssets.gamingImageLight,
      AppAssets.workshopImageLight,
      AppAssets.bookClubImageLight,
      AppAssets.exhibitionImageLight,
      AppAssets.holidayImageLight,
      AppAssets.eatingImageLight
    ];
    List<String> darkEventImagesList = [
      AppAssets.sportImage,
      AppAssets.birthdayImage,
      AppAssets.meetingImage,
      AppAssets.gamingImage,
      AppAssets.workshopImage,
      AppAssets.bookClubImage,
      AppAssets.exhibitionImage,
      AppAssets.holidayImage,
      AppAssets.eatingImage
    ];
    englishEventName=events[selectedIndex]["name_en"];
    arabicEventName=events[selectedIndex]["name_ar"];
    selectedImage=themeProvider.isDarkMode()? darkEventImagesList[selectedIndex]: eventImagesList[selectedIndex];
    lightImage=eventImagesList[selectedIndex];
    darkImage=darkEventImagesList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.update_event,
          style: AppStyles.mediumPrimary20,
        ),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(selectedImage),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              SizedBox(
                height: 0.1 * height,
                child: ScrollConfiguration(
                  behavior:
                      const MaterialScrollBehavior().copyWith(dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  }),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: EventTabItem(
                            title: events[index]["name"],
                            icon: events[index]["icon"],
                            isSelected: selectedIndex == events[index]["index"],
                            borderColor: AppColors.primaryLight,
                            selectedBgColor: AppColors.primaryLight,
                            selectedStyle:
                                Theme.of(context).textTheme.headlineSmall!,
                            unSelectedStyle: AppStyles.boldPrimary16,
                            selectedIconColor: Theme.of(context).dividerColor,
                            unSelectedIconColor: AppColors.primaryLight,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 0.025 * width,
                        );
                      },
                      itemCount: events.length),
                ),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      CustomTextFormField(
                        borderSideColor: themeProvider.isDarkMode()
                            ? AppColors.primaryLight
                            : AppColors.greyColor,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .missing_event_title_error;
                          }
                          return null;
                        },
                        controller: titleController,
                        prefixIcon: ImageIcon(
                          AssetImage(AppAssets.writingIcon),
                          color: Theme.of(context).primaryColorDark,
                        ),
                        hintText: AppLocalizations.of(context)!.event_title,
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      CustomTextFormField(
                        borderSideColor: themeProvider.isDarkMode()
                            ? AppColors.primaryLight
                            : AppColors.greyColor,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .missing_event_description_error;
                          }
                          return null;
                        },
                        controller: descriptionController,
                        hintText:
                            AppLocalizations.of(context)!.event_description,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      DateOrTimeWidget(
                          iconDateOrTimeName: AppAssets.calendarIcon,
                          eventDateOrTime:
                              AppLocalizations.of(context)!.event_date,
                          chooseDateOrTime: selectedDate==null?DateFormat('dd/MM/yyyy').format(event.dateTime):formattedDate!,
                          onChooseDateOrTimePressed: chooseDate),
                          // Visibility(
                          //   visible: showDateError,
                          //   child: Text(AppLocalizations.of(context)!.empty_date_error,style: AppStyles.boldPrimary16.copyWith(color: AppColors.redColor),)
                          // ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      DateOrTimeWidget(
                          iconDateOrTimeName: AppAssets.clockIcon,
                          eventDateOrTime:
                              AppLocalizations.of(context)!.event_time,
                          chooseDateOrTime: selectedTime==null?event.time:formattedTime!,
                          onChooseDateOrTimePressed: chooseTime),
                          // Visibility(
                          //   visible: showTimeError,
                          //   child: Text(AppLocalizations.of(context)!.empty_time_error,style: AppStyles.boldPrimary16.copyWith(color: AppColors.redColor),)
                          // ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02 * width, vertical: 0.01 * height),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primaryLight)),
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.03 * width,
                                vertical: 0.015 * height),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.primaryLight),
                            child: Icon(
                              Icons.my_location,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(
                            width: 0.01 * width,
                          ),
                          Text(
                            AppLocalizations.of(context)!.choose_event_location,
                            style: AppStyles.mediumPrimary16,
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryLight,
                              ))
                        ]),
                      ),
                      SizedBox(
                        height: 0.02 * height,
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            updateEvent();
                          },
                          butTitle: AppLocalizations.of(context)!.update_event),
                      SizedBox(
                        height: 0.02 * height,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = chooseDate??event.dateTime;
    formattedDate =DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {

    });
  }

  void chooseTime() async {
    var chooseTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime = chooseTime;
    setState(() {
      formattedTime =selectedTime!.format(context);
    });
  }

  Future<void> updateEvent() async{
    if (_formKey.currentState!.validate()) {
      Event myEvent=Event(
        id: event.id,
        imageLight: lightImage, 
        imageDark: darkImage, 
        title: titleController.text, 
        description: descriptionController.text, 
        englishEventName: englishEventName, 
        arabicEventName: arabicEventName, 
        dateTime: selectedDate??event.dateTime, 
        time: formattedTime??event.time,
        isFavorite: event.isFavorite
      );
      await eventListProvider.updateEventDetails(
        context: context,
        event: myEvent, 
        uId: userProvider.currentUser!.id
      ).then((value) {
        Navigator.pop(context,myEvent);
      },);
    }
  }
}
