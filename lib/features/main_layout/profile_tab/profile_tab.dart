import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../config/providers/config_provider.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
import '../../../core/widgets/custom_drop_down_button.dart';
import '../../../core/widgets/ui_utils/ui_utils.dart';
import '../../../l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
   ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: REdgeInsets.only(
                  top: 49, left: 16, right: 16, bottom: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      ImageAssets.routeLogo,
                      height: 124.h,
                      width: 124.w,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(UserModel.currentUser!.name, style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge),
                      SizedBox(height: 10.w),
                      Text(
                        UserModel.currentUser!.email,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Text("Language", style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomDropDownButton(
                itemsList: ["English", "العربيه"],
                selecetedItem: configProvider.isEnglish? "English":"العربيه",
                onChanged: (newLanguage) {
                  setState(() {
                    configProvider.changeLanguage(newLanguage=="English"? "en":"ar" );
                  });
                },
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Text("Theme", style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomDropDownButton(
                itemsList: [appLocalizations.light, appLocalizations.dark],
                selecetedItem: configProvider.isDark ? appLocalizations.dark : appLocalizations.light,
                onChanged: (newTheme) {
                  configProvider.changeTheme(newTheme == appLocalizations.light
                      ? ThemeMode.light
                      : ThemeMode.dark);
                },
              ),
            ),
            SizedBox(height: 16.h),
            Spacer(),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.red),
                onPressed: () {
                  logout();
                },
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Theme
                            .of(context)
                            .primaryColorLight,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        appLocalizations.logout,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
void logout() async{
    UIUtils.showLoading(context);
    await FirebaseAuth.instance.signOut();
    UIUtils.toastMessage(AppLocalizations.of(context)!.successfully_logged_out, Colors.green);
    UIUtils.hideDialog(context);
    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}
