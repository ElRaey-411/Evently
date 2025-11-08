import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/category_model.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.selectedBg,
    required this.unselectedBg,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    this.onPressed,
  });

  final List<CategoryModel> categories;
  final int selectedIndex;
  final Color selectedBg;
  final Color unselectedBg;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Function(int index)? onPressed;

  @override
  Widget build(BuildContext context) =>
      DefaultTabController(
        length: categories.length,
        child: TabBar(
          indicatorColor: Colors.transparent,
          onTap: onPressed,
          isScrollable: true,
          tabs: categories.asMap().entries.map(
                (entry) {
              final index = entry.key;
              final category = entry.value;
              final bool isSelected = index == selectedIndex;

              return Container(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? selectedBg : unselectedBg,
                  borderRadius: BorderRadius.circular(46.r),
                  border: Border.all(color: selectedBg, width: 1.w),
                ),
                child: Row(
                  children: [
                    Icon(
                      category.icon,
                      color: isSelected ? selectedTextColor : unselectedTextColor,
                    ),
                    SizedBox(width: 8.w),

                    Text(
                      category.name,
                      style: TextStyle(
                        color: isSelected ? selectedTextColor : unselectedTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      );
}
