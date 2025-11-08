import 'package:flutter/material.dart';
import '../../core/prefs_manager/prefs_manager.dart';

class ConfigProvider extends ChangeNotifier{

  ThemeMode currentTheme = PrefsManager.getTheme()?? ThemeMode.light;
  String currentLanguage = PrefsManager.getLang()?? "en";
  void changeTheme(ThemeMode newTheme){
    if(newTheme == currentTheme)return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(newTheme);
    notifyListeners();
  }
  void changeLanguage(String newLanguage){
    if(newLanguage == currentLanguage)return;
    currentLanguage = newLanguage;
    PrefsManager.saveLang(newLanguage);
    notifyListeners();
  }
  bool get isEnglish => currentLanguage == "en";
  bool get isDark => currentTheme == ThemeMode.dark;

}

