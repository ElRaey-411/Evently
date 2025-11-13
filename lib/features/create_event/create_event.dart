import 'package:evently/core/functions/validators.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/providers/config_provider.dart';
import '../../core/models/category_model.dart';
import '../../core/models/event_model.dart';
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
  DateTime selectedDateTime = DateTime.now();
  DateTime? pickerDate;
  DateTime? pickerTime;

  late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.create_event,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: _FormKey,
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
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
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
                Text(
                  appLocalizations.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                Text(
                  appLocalizations.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 8.h),
                CustomTextForm(
                  controller: descriptionController,
                  hintText: appLocalizations.event_description,
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      Validators.defaultValidator(context, value),
                  maxLines: 4,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Theme.of(context).disabledColor,
                    ),
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
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              pickerDate = value;
                              selectedDate =
                                  "${value.day.toString().padLeft(2, '0')}/${value.month.toString().padLeft(2, '0')}/${value.year}";

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
                    Icon(
                      Icons.timer_outlined,
                      color: Theme.of(context).disabledColor,
                    ),
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
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          if (value != null && pickerDate != null) {
                            // Combine picked date and picked time
                            setState(() {
                              selectedTime =
                                  "${value.hour}:${value.minute.toString().padLeft(2, '0')}";
                              selectedDateTime = DateTime(
                                pickerDate!.year,
                                pickerDate!.month,
                                pickerDate!.day,
                                value.hour,
                                value.minute,
                              );
                            });
                          } else if (value != null) {
                            // If date not picked yet, just set time string (optional)
                            setState(() {
                              selectedTime =
                                  "${value.hour}:${value.minute.toString().padLeft(2, '0')}";
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(8.0),
                        child: Card(
                          color: Theme.of(context).highlightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
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
                      Text(
                        appLocalizations.choose_event_location,
                        style: Theme.of(context).textTheme.labelMedium,
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
                  title: appLocalizations.add_event,
                  onPressed: () {
                    createEvent();
                  },
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
    if (!_FormKey.currentState!.validate() ||
        selectedTime == null ||
        selectedDate == null) {
      UIUtils.toastMessage(
        appLocalizations.please_select_time_and_date,
        Colors.red,
      );
      return;
    }
    selectedCategory;
    titleController;
    descriptionController;
    selectedDateTime;

    EventModel eventModel = EventModel(
      authorId: UserModel.currentUser!.id,
      id: "",
      category: selectedCategory,
      title: titleController.text,
      description: descriptionController.text,
      dateTime: selectedDateTime,
    );
    UIUtils.showLoading(context, isDismissible: false);
    await FirebaseService.addEventToFireStore(eventModel, context);
    UIUtils.hideDialog(context);
    UIUtils.toastMessage(
      appLocalizations.event_added_successfully,
      Colors.green,
    );
    Navigator.pop(context);
  }
}
