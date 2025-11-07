import 'package:evently/config/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/providers/config_provider.dart';
import 'core/routes_manager/routes_manager.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

Future<void> main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: EventlyApp()));
}

class EventlyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
   return ScreenUtilInit(
        designSize: const Size(393, 841),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: RoutesManager.routes,
              initialRoute: RoutesManager.mainLayout,
              theme: ThemeManager.light,
              darkTheme: ThemeManager.dark,
              themeMode: configProvider.currentTheme,
              locale: Locale("en"),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [
                Locale('en'),
                Locale('ar'),
              ],


            )
    );
  }
}
