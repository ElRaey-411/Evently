import 'package:evently/core/functions/validators.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/models/category_model.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_tab_bar.dart';
import '../../core/widgets/custom_text_form.dart';

class CreateEvent extends StatefulWidget {
  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late EventModel eventModel = EventModel(
    category: CategoryModel.Categories[SelectedIndex],
    eventTitle: "",
    eventDescription: "",
    eventDateTime: DateTime.now(),
  );
  int SelectedIndex = 0;
  String? selectedTime ;
  String? selectedDate;
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
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        "Create Event",
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
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(eventModel.category.lightPhotoPath!),
              ),
              SizedBox(height: 16.h),
              DefaultTabController(
                length: 9,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      SelectedIndex = index;
                      eventModel.category = CategoryModel.Categories[index];
                    });
                  },
                  isScrollable: true,
                  tabs: CategoryModel.Categories.map(
                    (Category) => CustomTabBar(
                      selectedBg: Theme.of(context).primaryColor,
                      unselectedBg: Theme.of(context).secondaryHeaderColor,
                      selectedTextColor: Theme.of(context).secondaryHeaderColor,
                      unselectedTextColor: Theme.of(context).primaryColor,
                      Category: Category,
                      isSelected:
                          SelectedIndex ==
                          CategoryModel.Categories.indexOf(Category),
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(height: 16.h),
              Text("Title", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 8.h),
              CustomTextForm(
                controller: titleController,
                prefixIcon: Icon(Icons.title),
                hintText: "Event Title",
                keyboardType: TextInputType.text,
                validator: Validators.defaultValidator,
              ),
              SizedBox(height: 16.h),
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextForm(
                controller: descriptionController,
                hintText: "  Event Description",
                keyboardType: TextInputType.text,
                validator: Validators.defaultValidator,
                maxLines: 4,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 14.w),
                  Text(
                    "${selectedDate==null?"Choose Date" : selectedDate}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text:"Choose Date",
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            selectedDate = "${value.day}/${value.month}/${value.year}";
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
                  Icon(Icons.timer_outlined),
                  SizedBox(width: 14.w),
                  Text(
                    "${selectedTime==null?"Choose Time" : selectedTime}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  CustomTextButton(text: "Choose Time", onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      setState(() {
                        selectedTime = value!.format(context);
                      });
                    }
                    );
                  }),
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
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(12),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "choose Location",
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
                title: "Add Event",
                onPressed: () {
                  if (_FormKey.currentState!.validate()||selectedTime==null || selectedDate==null) return;

                },
              ),
            ],
          ),
        ),
      ),
    ),

  );
}
