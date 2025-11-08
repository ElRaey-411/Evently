import 'package:evently/core/models/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/models/event_model.dart';
import '../../../core/widgets/custom_tab_bar.dart';
import '../../../core/widgets/event_item.dart';
import '../../../l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;
  late final bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return
      Scaffold(
        body: Column(
          children: [
            Container(
              padding: REdgeInsets.only(
                  top: 49, left: 16, right: 16, bottom: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${appLocalizations.welcome_back} ✨",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Ahmed",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge,
                          ),
                          SizedBox(height: 11.h),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Colors
                                  .white),
                              SizedBox(width: 5.w),
                              Text(
                                "Cairo, Egypt",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.wb_sunny_outlined, color: Colors.white),
                      SizedBox(width: 5.w),
                      Card(
                        elevation: 0,
                        color: Theme
                            .of(context)
                            .primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(
                            "EN",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomTabBar(
                    categories: CategoryModel.getCategoriesWithAll(context),
                    selectedIndex: SelectedIndex,
                    selectedBg: Theme.of(context).secondaryHeaderColor,
                    unselectedBg: Colors.transparent,
                    selectedTextColor: Theme.of(context).primaryColorDark,
                    unselectedTextColor: Theme.of(context).primaryColorLight,
                    onPressed: onPressed,
                  )

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder:
                    (context, index) =>
                    EventItem(
                      event: EventModel.getEvents(context)[index],
                    ),
                itemCount: EventModel.getEvents(context).length,
              ),
            )
          ],
        ),
      );
  }
  void onPressed(int index) {
    setState(() {
      SelectedIndex = index;
    });
  }

}
