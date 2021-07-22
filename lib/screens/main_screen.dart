import 'package:budget_planner/getx/add_operation_getx_controller.dart';
import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/models/bn_screen.dart';
import 'package:budget_planner/screens/bn_screen/category_screen.dart';
import 'package:budget_planner/screens/bn_screen/home_screen.dart';
import 'package:budget_planner/screens/bn_screen/tips_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bn_screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int currentIndex = 0;

  CategoryGetxController categoryGetxController = Get.put(CategoryGetxController());
  ActionsGetxController actionGetxController = Get.put(ActionsGetxController());

  List<BnScreen> screens = <BnScreen>[
    BnScreen(title: 'Home', widget: HomeScreen()),
    BnScreen(title: 'Category', widget: CategoryWithDetailsScreen()),
    BnScreen(title: '', widget: CategoryWithDetailsScreen()),
    BnScreen(title: 'Profile', widget: ProfileScreen()),
    BnScreen(title: 'Tips', widget: TipsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 4 ? Color(0xFFF1F4FF) : Colors.white,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: AppStyleColors.PRIMARY_COLOR,
        unselectedItemColor: AppStyleColors.GRAY_COLOR,
        selectedLabelStyle: TextStyle(
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(10),
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(10),
        ),
        items: [
          createBottomNavigationBarItem(label: AppLocalizations.of(context)!.home , svgIcon: 'home'),
          createBottomNavigationBarItem(label: AppLocalizations.of(context)!.categories, svgIcon: 'category'),
          BottomNavigationBarItem(
              icon: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_operation_screen');
                },
                child: Icon(Icons.add),
                backgroundColor: AppStyleColors.PRIMARY_COLOR,
                elevation: 0,
              ),
              label: ''),
          createBottomNavigationBarItem(label: AppLocalizations.of(context)!.profile, svgIcon: 'person'),
          createBottomNavigationBarItem(label: AppLocalizations.of(context)!.tips, svgIcon: 'alert'),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: AppTextWidget(
          screens[currentIndex].title,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
        actions: [
          Visibility(
            child: IconButton(
              icon: Icon(Icons.settings),
              color: AppStyleColors.PRIMARY_COLOR,
              onPressed: () {
                Navigator.pushNamed(context, '/settings_screen');
              },
            ),
            visible: currentIndex == 0,
          ),
          Visibility(
            child: IconButton(
              icon: Icon(Icons.add_circle_outlined),
              color: AppStyleColors.PRIMARY_COLOR,
              onPressed: () {
                Navigator.pushNamed(context, '/create_category_screen');
              },
            ),
            visible: currentIndex == 1,
          ),
        ],
      ),
      body: screens[currentIndex].widget,
    );
  }
}

BottomNavigationBarItem createBottomNavigationBarItem({
  required String svgIcon,
  required String label,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: SvgPicture.asset(
      'assets/svg/$svgIcon.svg',
      height: SizeConfig.scaleHeight(22),
      width: SizeConfig.scaleHeight(22),
      color: AppStyleColors.GRAY_COLOR,
    ),
    activeIcon: SvgPicture.asset(
      'assets/svg/$svgIcon.svg',
      color: AppStyleColors.PRIMARY_COLOR,
      height: SizeConfig.scaleHeight(22),
      width: SizeConfig.scaleHeight(22),
    ),
  );
}
