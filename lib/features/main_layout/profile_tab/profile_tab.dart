import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/widgets/custom_drop_down_button.dart';

class ProfileTab extends StatefulWidget {
   ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String selectedLanguage = "English";
  String selectedTheme= "Light";

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.only(top: 49, left: 16, right: 16, bottom: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  ImageAssets.routeLogo,
                  height: 124.h,
                  width: 124.w,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahmed", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 10.w),
                  Text(
                    "Ahmed123@gmail.com",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Text("Language", style: Theme.of(context).textTheme.bodyLarge),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: CustomDropDownButton(
            itemsList: ["English", "العربيه"],
            selecetedItem: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value!;
              });
            },
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: CustomDropDownButton(
            itemsList: ["Light", "Dark"],
            selecetedItem: selectedTheme,
            onChanged: (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),
        ),
        SizedBox(height: 16.h),
        Spacer(),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16,vertical: 32),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.red),
            onPressed: () {},
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    "Logout",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
