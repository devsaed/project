import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      String route = SharedPrefController().isLoggedIn ? '/main_screen' : '/on_boarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: SizeConfig.scaleHeight(170),
          width: SizeConfig.scaleWidth(170),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.scaleWidth(42),
            vertical: SizeConfig.scaleHeight(24),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppStyleColors.SHADOW_COLOR,
                offset: Offset(0, SizeConfig.scaleHeight(10)),
                blurRadius: SizeConfig.scaleHeight(18),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
            ),
          ),
        ),
      ),
    );
  }
}
