import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../config/providers/config_provider.dart';
import '../../core/models/event_model.dart';
import '../../core/models/user_model.dart';
import '../../core/widgets/outlined_container.dart';
import '../../l10n/app_localizations.dart';

class EventDetails extends StatelessWidget {
   EventDetails({super.key});
   Set<Marker> markers = {};

   @override
  Widget build(BuildContext context) {

    var configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;
    setMarker(LatLng(event.lat, event.long));
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          appLocalizations.event_details,
          style: GoogleFonts.inter(
            color: ColorsManager.blue,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
      ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorsManager.blue,
          ),
        ),
        actions: [
          Visibility(
            visible: UserModel.currentUser!.id == event.authorId,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.createEvent,arguments: event);
              },
              icon: Icon(
                Icons.edit,
                color: ColorsManager.blue,
              ),
            ),
          ),
          Visibility(
            visible: UserModel.currentUser!.id == event.authorId,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: ColorsManager.red,
              ),
            ),
          ),
        ],
      ),
          body:Padding(
            padding: REdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: ColorsManager.blue,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        configProvider.isDark
                            ? event.category.darkPhotoPath!
                            : event.category.lightPhotoPath!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      event.title,
                      style: GoogleFonts.inter(
                        color: Theme.of(context).highlightColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  OutlinedContainer(
                    icon: Icons.calendar_month_outlined,
                    isDateTime: true,
                    dateTime: event.dateTime,
                    city: event.city,
                    country: event.country,
                  ),
                  SizedBox(height: 16.h),
                  OutlinedContainer(
                    icon: Icons.location_on_outlined,
                    isDateTime: false,
                    dateTime: event.dateTime,
                    city: event.city,
                    country: event.country,
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        width: 1.0,
                        color: ColorsManager.blue,
                      )
                    ),
                    width: 360.w,
                    height: 360.h,
                    child: GoogleMap(
                      markers: markers,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(event.lat, event.long),
                        zoom: 15,
                      ),

                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    appLocalizations.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 16.h),

                ],
              ),
            ),
          ),
    );
  }
  void setMarker(LatLng latLng) {
    markers.add(
      Marker(
        markerId: MarkerId("eventLocation"),
        position: latLng,
      )
    );
  }
}
