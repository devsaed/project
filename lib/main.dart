import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/screens/about_screen.dart';
import 'package:budget_planner/screens/add_category_screen.dart';
import 'package:budget_planner/screens/add_opatation.dart';
import 'package:budget_planner/screens/bin_code_screen.dart';
import 'package:budget_planner/screens/category_screen.dart';
import 'package:budget_planner/screens/create_account_screen.dart';
import 'package:budget_planner/screens/login_screen.dart';
import 'package:budget_planner/screens/main_screen.dart';
import 'package:budget_planner/screens/launch_screen.dart';
import 'package:budget_planner/screens/on_boarding_screen.dart';
import 'package:budget_planner/screens/settings_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'database/db_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await SharedPrefController().initSharePre();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('ar'), // Spanish, no country code
      ],
      locale: Locale('en'),
      initialRoute: ('/main_screen'),
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
  }
}
