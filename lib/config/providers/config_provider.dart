import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  void changeTheme(ThemeMode newTheme){
    if(newTheme == currentTheme)return;
    currentTheme = newTheme;
    notifyListeners();
  }
  bool get isDark => currentTheme == ThemeMode.dark;

}

