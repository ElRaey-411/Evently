import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../resources/assets_manager.dart';

class CategoryModel{
  CategoryModel({
    required this.id,
    required this.name,
    required this.lightPhotoPath,
    required this.darkPhotoPath,
    required this.icon,
  });
  String id;
  String name;
  String? lightPhotoPath;
  String? darkPhotoPath;
  IconData icon;

 static List<CategoryModel> getCategories (BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return[
      CategoryModel(id: "1", name: appLocalizations.birthday,icon: Icons.cake_rounded, lightPhotoPath: ImageAssets.lightBirthday, darkPhotoPath: ImageAssets.darkBirthday),
      CategoryModel(id: "2", name: appLocalizations.book_club,icon: Icons.book_outlined, lightPhotoPath: ImageAssets.lightBookClub, darkPhotoPath: ImageAssets.darkBookClub),
      CategoryModel(id: "3", name: appLocalizations.eating,icon: Icons.local_pizza_rounded, lightPhotoPath: ImageAssets.lightEating, darkPhotoPath: ImageAssets.darkEating),
      CategoryModel(id: "4", name: appLocalizations.exhibition,icon: Icons.water_drop_rounded, lightPhotoPath: ImageAssets.lightExhibition, darkPhotoPath: ImageAssets.darkExhibition),
      CategoryModel(id: "5", name: appLocalizations.gaming,icon: Icons.gamepad_rounded, lightPhotoPath: ImageAssets.lightGaming, darkPhotoPath: ImageAssets.darkGaming),
      CategoryModel(id: "6", name: appLocalizations.holiday,icon: Icons.holiday_village_rounded, lightPhotoPath: ImageAssets.lightHoliday, darkPhotoPath: ImageAssets.darkHoliday),
      CategoryModel(id: "7", name: appLocalizations.meeting,icon: Icons.laptop_mac_rounded, lightPhotoPath: ImageAssets.lightMeeting, darkPhotoPath: ImageAssets.darkMeeting),
      CategoryModel(id: "8", name: appLocalizations.sport,icon: Icons.sports_football_rounded, lightPhotoPath: ImageAssets.lightSport, darkPhotoPath: ImageAssets.darkSport),
      CategoryModel(id: "9", name: appLocalizations.work_shop,icon: Icons.workspaces_rounded, lightPhotoPath: ImageAssets.lightWorkShop, darkPhotoPath: ImageAssets.darkWorkShop),
    ];

  }
  static List<CategoryModel> getCategoriesWithAll (BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return[
      CategoryModel(id: "0", name: appLocalizations.all,icon: Icons.all_inclusive, lightPhotoPath:null, darkPhotoPath: null),
      CategoryModel(id: "1", name: appLocalizations.birthday,icon: Icons.cake_rounded, lightPhotoPath: ImageAssets.lightBirthday, darkPhotoPath: ImageAssets.darkBirthday),
      CategoryModel(id: "2", name: appLocalizations.book_club,icon: Icons.book_outlined, lightPhotoPath: ImageAssets.lightBookClub, darkPhotoPath: ImageAssets.darkBookClub),
      CategoryModel(id: "3", name: appLocalizations.eating,icon: Icons.local_pizza_rounded, lightPhotoPath: ImageAssets.lightEating, darkPhotoPath: ImageAssets.darkEating),
      CategoryModel(id: "4", name: appLocalizations.exhibition,icon: Icons.water_drop_rounded, lightPhotoPath: ImageAssets.lightExhibition, darkPhotoPath: ImageAssets.darkExhibition),
      CategoryModel(id: "5", name: appLocalizations.gaming,icon: Icons.gamepad_rounded, lightPhotoPath: ImageAssets.lightGaming, darkPhotoPath: ImageAssets.darkGaming),
      CategoryModel(id: "6", name: appLocalizations.holiday,icon: Icons.holiday_village_rounded, lightPhotoPath: ImageAssets.lightHoliday, darkPhotoPath: ImageAssets.darkHoliday),
      CategoryModel(id: "7", name: appLocalizations.meeting,icon: Icons.laptop_mac_rounded, lightPhotoPath: ImageAssets.lightMeeting, darkPhotoPath: ImageAssets.darkMeeting),
      CategoryModel(id: "8", name: appLocalizations.sport,icon: Icons.sports_football_rounded, lightPhotoPath: ImageAssets.lightSport, darkPhotoPath: ImageAssets.darkSport),
      CategoryModel(id: "9", name: appLocalizations.work_shop,icon: Icons.workspaces_rounded, lightPhotoPath: ImageAssets.lightWorkShop, darkPhotoPath: ImageAssets.darkWorkShop),
    ];

  }

}