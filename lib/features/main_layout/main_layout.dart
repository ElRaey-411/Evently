import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/features/main_layout/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import '../../core/routes_manager/routes_manager.dart';
import '../../l10n/app_localizations.dart';
import 'favorite_tab/favorite_tab.dart';
import 'home_tab/home_tab.dart';
import 'map_tap/map_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeTab(),
    MapTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return
      Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar:
        BottomNavigationBar(

            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },

            items: [
              BottomNavigationBarItem(icon: Icon(
                  selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                  label: appLocalizations.home),
              BottomNavigationBarItem(icon: Icon(
                  selectedIndex == 1 ? Icons.location_on : Icons
                      .location_on_outlined), label: appLocalizations.map),
              BottomNavigationBarItem(icon: Icon(
                  selectedIndex == 2 ? Icons.favorite : Icons.favorite_border),
                  label: appLocalizations.favourite),
              BottomNavigationBarItem(icon: Icon(
                  selectedIndex == 3 ? Icons.person : Icons.person_outline),
                  label: appLocalizations.profile),
            ]

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.createEvent);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      );
  }
}
