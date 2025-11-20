import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTabProvider extends ChangeNotifier {
  MapTabProvider() {
    getUserLocation();
  }

  LatLng? eventLocation;
  String? city;
  String? country;

  Set<Marker> markers = {};

  GoogleMapController? mapController;

  CameraPosition cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 1);

  final Location location = Location();

  void pickLocation(LatLng location) async {
    eventLocation = location;
    markers = {};

    markers.add(
      Marker(
        markerId: MarkerId("eventLocation"),
        position: location,
        infoWindow: InfoWindow(
          title: "Event Location",
          snippet: "This is Event Location",
        ),
      ),
    );
    await latLangToAddress();
    notifyListeners();
  }

  void removeMarkers() {
    markers = {};
  }

  Future<void> latLangToAddress() async {
    if (eventLocation == null) return;
    List<geo.Placemark> placeMarks = await geo.placemarkFromCoordinates(
      eventLocation?.latitude ?? 0,
      eventLocation?.longitude ?? 0,
    );
    if (placeMarks.isNotEmpty) {
      city= placeMarks.first.locality??"unknown";
      country= placeMarks.first.country??"unknown";
    }
  }

  Future<bool> _checkGPSService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  Future<bool> _getLocationPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<void> getUserLocation() async {
    bool isGPSServiceEnabled = await _checkGPSService();

    bool isPermissionGranted = await _getLocationPermission();

    if (!isPermissionGranted || !isGPSServiceEnabled) return;

    LocationData locationData = await location.getLocation();

    changeCameraPosition(locationData);

    notifyListeners();
  }

  void changeCameraPosition(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 16,
    );

    if (!markers.any((marker) => marker.markerId.value == "userLocation")) {
      markers.add(
        Marker(
          markerId: MarkerId("userLocation"),
          position: LatLng(
            locationData.latitude ?? 0,
            locationData.longitude ?? 0,
          ),
          infoWindow: InfoWindow(
            title: "My Location",
            snippet: "This is my current Location",
          ),
        ),
      );
    }

    if (mapController != null) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }
}