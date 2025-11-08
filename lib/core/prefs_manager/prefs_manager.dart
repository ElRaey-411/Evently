import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
 static late SharedPreferences prefs;
 static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }
 static const String themeKey='saved_theme';
 static const String langKey='saved_lang';

  static void saveTheme(ThemeMode themeMode) {
    String SavedTheme= themeMode==ThemeMode.light? 'light': 'dark' ;
    prefs.setString(themeKey, SavedTheme);
  }
  static ThemeMode? getTheme(){
     String? savedTheme = prefs.getString(themeKey);
     if(savedTheme==null){
       return null;
     }
     return savedTheme=='light'?ThemeMode.light:ThemeMode.dark;
  }

  static void saveLang(String lang){
     prefs.setString(langKey, lang);
  }
  static getLang(){
    String? savedLang = prefs.getString(langKey);
    if(savedLang==null){
      return null;
    }
    return savedLang;

  }

}