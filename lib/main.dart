import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/screens/about_screen.dart';
import 'package:budget_planner/screens/category/add_category_screen.dart';
import 'package:budget_planner/screens/operation/add_opatation.dart';
import 'package:budget_planner/screens/auth/bin_code_screen.dart';
import 'package:budget_planner/screens/category/category_screen.dart';
import 'package:budget_planner/screens/auth/create_account_screen.dart';
import 'package:budget_planner/screens/auth/login_screen.dart';
import 'package:budget_planner/screens/main_screen.dart';
import 'package:budget_planner/screens/launch_screen.dart';
import 'package:budget_planner/screens/on_boarding/on_boarding_screen.dart';
import 'package:budget_planner/screens/settings_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'database/db_provider.dart';
import 'getx/language_getx_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await SharedPrefController().initSharePre();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  LanguageGetxController languageGetxController =
      Get.put(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        locale: Locale(languageGetxController.languageCode.value),
        // locale: Locale('ar'),
        initialRoute: ('/launch_screen'),
        routes: {
          '/on_boarding_screen': (context) => OnBoardingScreen(),
          '/launch_screen': (context) => LaunchScreen(),
          '/main_screen': (context) => MainScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/bin_code_screen': (context) => BinCodeScreen(),
          '/about_screen': (context) => AboutScreen(),
          '/settings_screen': (context) => SettingsScreen(),
          '/create_account_screen': (context) => CreateAccountScreen(),
          '/create_category_screen': (context) => AddCategoryScreen(),
          '/add_operation_screen': (context) => AddOperation(),
          '/category_screen': (context) => CategoryScreen(),
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              size: 30,
            ),
          ),
        ),
      );
    });
  }
}
