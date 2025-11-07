import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/event_model.dart';

class EventItem extends StatelessWidget {
  EventItem({super.key, required this.event});

  EventModel event;

  @override
  Widget build(BuildContext context) => Container(
    margin: REdgeInsets.only(bottom: 16, left: 16, right: 16),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(event.category.lightPhotoPath!),
        ),
        Positioned(
          top: 8.h,
          left: 8.h,
          child: Card(
            elevation: 0,
            color: Theme.of(context).secondaryHeaderColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    event.eventDateTime.day.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    getMonthName(event.eventDateTime.month),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          left: 8.h,
          right: 8.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    event.eventTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
