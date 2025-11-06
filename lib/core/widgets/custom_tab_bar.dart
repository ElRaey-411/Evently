import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/category_model.dart';

class CustomTabBar extends StatelessWidget {
   CustomTabBar({super.key, required this.Category,required this.isSelected});
  final CategoryModel Category;
  final bool isSelected ;


  @override
  Widget build(BuildContext context) =>
      Container(
        padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8 ),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).secondaryHeaderColor : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(46.r),
          border: Border.all(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1.w,
          )

        ),
        child: Row(
          children: [
            Icon( Category.icon,color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor,),
            SizedBox(width: 8.w,),
            Text(Category.name,style: isSelected? Theme.of(context).textTheme.titleMedium: Theme.of(context).textTheme.titleSmall,)

            
          ]
        ),

      );
}
