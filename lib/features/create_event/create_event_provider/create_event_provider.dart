import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/providers/map_tab_provider.dart';
import '../../../core/models/event_model.dart';

class CreatEventProvider extends ChangeNotifierProvider{
  CreatEventProvider({required super.create});


  String? selectedTime;
  String? selectedDate;
  String? city;
  String? country;
  LatLng? eventLocation;
  DateTime selectedDateTime = DateTime.now();
  DateTime? pickerDate;
  int selectedIndex = 0;
  EventModel? event;
  bool isEdit = false;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}