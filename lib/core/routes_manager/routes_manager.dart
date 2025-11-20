import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/providers/map_tab_provider.dart';
import '../../features/authentication/login_screen/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/create_event/choose_location.dart';
import '../../features/create_event/create_event.dart';
import '../../features/event_details/event_details.dart';
import '../../features/main_layout/main_layout.dart';

abstract class RoutesManager {
  static const String login = 'login';
  static const String register = 'register';
  static const String mainLayout = 'home';
  static const String createEvent = 'createEvent';
  static const String eventDetails = 'eventDetails';
  static const String chooseLocation = 'chooseLocation';
  static const String eventEdit = 'eventEdit';


  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
    mainLayout: (context) => MainLayout(),
    createEvent: (context) => CreateEvent(),
    eventDetails:(context)=> EventDetails(),
    chooseLocation: (context) => ChooseLocation(),
  };
}
