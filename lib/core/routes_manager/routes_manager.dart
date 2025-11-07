import 'package:flutter/material.dart';
import '../../features/authentication/login_screen/login_screen.dart';
import '../../features/authentication/register_screen/register_screen.dart';
import '../../features/create_event/create_event.dart';
import '../../features/main_layout/main_layout.dart';

abstract class RoutesManager {

  static const String login = 'login';
  static const String register = 'register';
  static const String mainLayout = 'home';
  static const String createEvent = 'createEvent';
  static Map<String, WidgetBuilder> routes = {
    login:(context)=> LoginScreen(),
    register:(context)=> RegisterScreen(),
    mainLayout:(context)=> MainLayout(),
    createEvent:(context)=> CreateEvent(),
  };

}