
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/category_model.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    super.key,
    required this.Category,
    required this.isSelected,
    required this.selectedBg,
    required this.unselectedBg,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  final CategoryModel Category;
  final bool isSelected;
  final Color selectedBg;
  final Color unselectedBg;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  @override
  Widget build(BuildContext context) => Container(
    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? selectedBg : unselectedBg,
      borderRadius: BorderRadius.circular(46.r),
      border: Border.all(color: selectedBg, width: 1.w),
    ),
    child: Row(
      children: [
        Icon(Category.icon, color: isSelected ? selectedTextColor : unselectedTextColor),
        SizedBox(width: 8.w),
        Text(
          Category.name,
          style: TextStyle(
            color: isSelected ? selectedTextColor : unselectedTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          )
        ),
      ],
    ),
  );
}
