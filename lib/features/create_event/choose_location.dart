import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../config/providers/map_tab_provider.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MapTabProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              markers: provider.markers,
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
              onTap: (location) async {
                 provider.pickLocation(location);
                if (mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: ColorsManager.blue,
            padding: REdgeInsets.all(20),
            child: Text(
              "Tap on Location To Select",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: ColorsManager.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}