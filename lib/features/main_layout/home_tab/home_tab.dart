import 'package:evently/core/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_tab_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Container(
          padding: REdgeInsets.only(top: 49, left: 16, right: 16, bottom: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
                        "Welcome Back ✨",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Ahmed",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.white),
                          SizedBox(width: 5.w),
                          Text(
                            "Cairo, Egypt",
                            style: Theme.of(context).textTheme.titleSmall,
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
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Text(
                        "EN",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              DefaultTabController(
                length: 10,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      SelectedIndex = index;
                    });
                  },
                  isScrollable: true,
                  tabs: CategoryModel.Categories.map(
                    (Category) => CustomTabBar(
                      Category: Category,
                      isSelected:
                          SelectedIndex ==
                          CategoryModel.Categories.indexOf(Category),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
