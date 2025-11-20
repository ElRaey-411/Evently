import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/providers/map_tab_provider.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MapTabProvider>(context);
    return
    Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.getUserLocation();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.my_location),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              markers: provider.markers,
              initialCameraPosition:provider.cameraPosition,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
            )
          )
        ]
      )
    );
  }
}
