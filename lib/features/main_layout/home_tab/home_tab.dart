import 'package:evently/core/models/category_model.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../config/providers/config_provider.dart';
import '../../../core/models/event_model.dart';
import '../../../core/widgets/custom_tab_bar.dart';
import '../../../core/widgets/event_item.dart';
import '../../../firebase/firebase_service.dart';
import '../../../l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  late CategoryModel selectedCategoryModel = CategoryModel.getCategoriesWithAll(context)[0];

  late final bool isSelected = false;
  List<EventModel> events = [];

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: REdgeInsets.only(top: 49, left: 16, right: 16, bottom: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${appLocalizations.welcome_back} ✨",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          UserModel.currentUser!.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Cairo, Egypt",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                        configProvider.changeTheme(configProvider.isDark?ThemeMode.light:ThemeMode.dark);
                    }, icon:Icon(configProvider.isDark?Icons.light_mode:Icons.dark_mode,color: Colors.white,)),
                    SizedBox(width: 5.w),
                    InkWell(
                      onTap: () {
                        configProvider.changeLanguage(configProvider.isEnglish? "ar":"en");
                      },
                      child: Card(
                        elevation: 0,
                        color: Theme.of(context).primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(
                            configProvider.isEnglish?"عربى":"En",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomTabBar(
                  categories: CategoryModel.getCategoriesWithAll(context),
                  selectedBg: Theme.of(context).secondaryHeaderColor,
                  unselectedBg: Colors.transparent,
                  selectedTextColor: Theme.of(context).primaryColorDark,
                  unselectedTextColor: Theme.of(context).primaryColorLight,
                  onPressed: (category) {
                    setState(() {
                      selectedCategoryModel= category;
                    });
                  },
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: FirebaseService.getEventFromFireStoreRealTime(context, selectedCategoryModel),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
                }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()));
              }
              List<EventModel> events = snapshot.data!;
              return Expanded(
                child:
                ListView.builder(
                  itemBuilder:
                      (context, index) =>
                      EventItem(
                        event: events[index],
                        isFavorite: UserModel.currentUser!.favoritesEventsIds.contains(events[index].id),
                      ),
                  itemCount: events.length,
                ),
              );

            },
          ),
        ],
      ),
    );
  }




}
