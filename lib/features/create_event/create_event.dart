import 'package:evently/core/functions/validators.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../config/providers/config_provider.dart';
import '../../config/providers/map_tab_provider.dart';
import '../../core/models/category_model.dart';
import '../../core/models/event_model.dart';
import '../../core/routes_manager/routes_manager.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_tab_bar.dart';
import '../../core/widgets/custom_text_form.dart';
import '../../core/widgets/ui_utils/ui_utils.dart';
import '../../firebase/firebase_service.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String? selectedTime;
  String? selectedDate;
  String? city;
  String? country;
  LatLng? eventLocation;
  DateTime selectedDateTime = DateTime.now();
  DateTime? pickerDate;
  int selectedIndex = 0;
  EventModel? event;
  bool isEdit = false;


  late CategoryModel selectedCategory =
  CategoryModel.getCategories(context)[0];

  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is EventModel) {
        event = args;
        isEdit = true;
        setData();
        setState(() {});
      }
    });
  }

  void setData() {
    if (event != null) {
      isEdit = true;
      selectedCategory = event!.category;
      selectedIndex = CategoryModel.getCategories(context)
          .indexOf(selectedCategory);

      titleController.text = event!.title;
      descriptionController.text = event!.description;

      selectedDate =
      "${event!.dateTime.day}/${event!.dateTime.month}/${event!.dateTime.year}";

      selectedTime =
      "${event!.dateTime.hour}:${event!.dateTime.minute}";
      selectedDateTime = event!.dateTime;

      eventLocation = LatLng(event!.lat, event!.long);
      city = event!.city;
      country = event!.country;
    }
  }

  void setLocation(MapTabProvider provider){
    eventLocation = provider.eventLocation;
    city = provider.city;
    country = provider.country;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MapTabProvider>(context);
    setLocation(provider);
    var configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? appLocalizations.edit_event : appLocalizations.create_event,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).highlightColor,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      configProvider.isDark
                          ? selectedCategory.darkPhotoPath!
                          : selectedCategory.lightPhotoPath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                CustomTabBar(
                  selectedIndex: selectedIndex,
                  categories: CategoryModel.getCategories(context),
                  selectedBg: Theme.of(context).highlightColor,
                  unselectedBg: Colors.transparent,
                  selectedTextColor: Theme.of(context).hoverColor,
                  unselectedTextColor: Theme.of(context).highlightColor,
                  onPressed: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),

                SizedBox(height: 16.h),

                Text(appLocalizations.title,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8.h),
                CustomTextForm(
                  controller: titleController,
                  prefixIcon: Icon(Icons.title),
                  hintText: appLocalizations.event_title,
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      Validators.defaultValidator(context, value),
                ),

                SizedBox(height: 16.h),

                Text(appLocalizations.description,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8.h),
                CustomTextForm(
                  controller: descriptionController,
                  hintText: appLocalizations.event_description,
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  validator: (value) =>
                      Validators.defaultValidator(context, value),
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                        color: Theme.of(context).disabledColor),
                    SizedBox(width: 14.w),
                    Text(
                      selectedDate ?? appLocalizations.choose_date,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                      text: appLocalizations.choose_date,
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: selectedDateTime,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              pickerDate = value;
                              selectedDate =
                              "${value.day}/${value.month}/${value.year}";
                              selectedDateTime = DateTime(
                                value.year,
                                value.month,
                                value.day,
                                selectedDateTime.hour,
                                selectedDateTime.minute,
                              );
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Icon(Icons.timer_outlined,
                        color: Theme.of(context).disabledColor),
                    SizedBox(width: 14.w),
                    Text(
                      selectedTime ?? appLocalizations.choose_time,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                      text: appLocalizations.choose_time,
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              selectedTime =
                              "${value.hour}:${value.minute.toString().padLeft(2, '0')}";
                              selectedDateTime = DateTime(
                                selectedDateTime.year,
                                selectedDateTime.month,
                                selectedDateTime.day,
                                value.hour,
                                value.minute,
                              );
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesManager.chooseLocation,
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(8),
                        child: Card(
                          color: Theme.of(context).highlightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: REdgeInsets.all(12),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text
                        (
                          city != null && country != null
                              ? "${city}, ${country}"
                              : appLocalizations.choose_event_location,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                CustomElevatedButton(
                  title: isEdit
                      ? appLocalizations.edit_event
                      : appLocalizations.add_event,
                  onPressed: createEvent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createEvent() async {

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    if (selectedDate == null) {
      UIUtils.toastMessage(appLocalizations.please_select_date, Colors.red);
      return;
    }
    if (selectedTime == null) {
      UIUtils.toastMessage(appLocalizations.please_select_time, Colors.red);
      return;
    }
    if (eventLocation == null || city == null || country == null) {
      UIUtils.toastMessage(
          appLocalizations.please_select_event_location, Colors.red);
      return;
    }

    EventModel eventModel = EventModel(
      lat: eventLocation!.latitude,
      long: eventLocation!.longitude,
      city: city ?? "Unknown",
      country: country ?? "Unknown",
      authorId: UserModel.currentUser!.id,
      id: isEdit ? (event?.id ?? "") : "",
      category: selectedCategory,
      title: titleController.text,
      description: descriptionController.text,
      dateTime: selectedDateTime,
    );

    UIUtils.showLoading(context, isDismissible: false);

    if (isEdit) {
      await FirebaseService.updateEventToFireStore(eventModel, context);
    } else {
      await FirebaseService.addEventToFireStore(eventModel, context);
    }

    UIUtils.hideDialog(context);

    UIUtils.toastMessage(
      isEdit
          ? appLocalizations.event_updated_successfully
          : appLocalizations.event_added_successfully,
      Colors.green,
    );
    Navigator.pop(context);
  }
  
}