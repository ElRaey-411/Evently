import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinedContainer extends StatelessWidget {
  OutlinedContainer({super.key, required this.icon,required this.isDateTime,required this.dateTime,required this.city,required this.country});

  IconData icon;
  bool isDateTime;
  DateTime dateTime;
  String city;
  String country;


  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 70.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(width: 1.0, color: ColorsManager.blue),
    ),
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
              padding: REdgeInsets.all(12.0),
              child: Icon(icon, color: Theme.of(context).hoverColor),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        isDateTime?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${dateTime.day}  ${getMonthName(dateTime.month)}  ${dateTime.year}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "${dateTime.hour}:${dateTime.minute}",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ):
            Expanded(child: Text("${city == "" ? "unknown":city}, $country",style: Theme.of(context).textTheme.labelMedium)),
        Spacer(),
        Padding(
          padding: REdgeInsets.all(8.0),
          child: Visibility(
              visible: !isDateTime,
              child:Icon(Icons.arrow_forward_ios_outlined, color: ColorsManager.blue,)
          ),
        )
      ],
    ),
  );

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'january';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
