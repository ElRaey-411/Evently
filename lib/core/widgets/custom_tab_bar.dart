import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/category_model.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedBg,
    required this.unselectedBg,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    this.onPressed,
  });

  final List<CategoryModel> categories;
  final Color selectedBg;
  final Color unselectedBg;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final void Function(CategoryModel category)? onPressed;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: widget.categories.length,
    child: TabBar(
      indicatorColor: Colors.transparent,
      isScrollable: true,
      onTap: (index) {
        widget.onPressed?.call(widget.categories[index]);
        setState(() {
          selectedIndex = index;
        });
      },
      tabs: List.generate(widget.categories.length, (index) {
        final category = widget.categories[index];
        final isSelected = selectedIndex == index;
        return Tab(
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? widget.selectedBg : widget.unselectedBg,
              borderRadius: BorderRadius.circular(46.r),
              border: Border.all(color: widget.selectedBg, width: 1.w),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  category.icon,
                  color: isSelected
                      ? widget.selectedTextColor
                      : widget.unselectedTextColor,
                ),
                SizedBox(width: 8.w),
                Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected
                        ? widget.selectedTextColor
                        : widget.unselectedTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
