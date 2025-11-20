import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/providers/config_provider.dart';
import '../../firebase/firebase_service.dart';
import '../models/event_model.dart';

class EventItem extends StatefulWidget {
  EventItem({super.key, required this.event,required this.isFavorite,this.onFavourite,this.onEventDetails});

  EventModel event;
  bool isFavorite ;
  void Function()? onFavourite;
  void Function()? onEventDetails;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return InkWell(
      onTap: () {
        widget.onEventDetails?.call();
      },

      child: Container(
      margin: REdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: Theme.of(context).highlightColor,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                configProvider.isDark?
                widget.event.category.darkPhotoPath!:widget.event.category.lightPhotoPath!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          Positioned(
            top: 8.h,
            left: 8.h,
            child: Card(
              elevation: 0,
              color: Theme.of(context).hoverColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: REdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      widget.event.dateTime.day.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      getMonthName(widget.event.dateTime.month),
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
                color: Theme.of(context).hoverColor,
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.onFavourite?.call();
                          if(widget.isFavorite){
                            FirebaseService.removeEventToFavourites(widget.event);
                            widget.isFavorite = false;
                          }else{
                            FirebaseService.addEventToFavourites(widget.event);
                            widget.isFavorite = true;
                          }
                        });
                      },
                      icon: Icon(
                        widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Theme.of(context).highlightColor,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        ),
    );
  }

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
