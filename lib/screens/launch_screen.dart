import 'package:budget_planner/getx/currency_getx_controller.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();

}

class _LaunchScreenState extends State<LaunchScreen> {
  CurrencyGetxController currencyGetxController = Get.put(CurrencyGetxController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      String route = SharedPrefController().isLoggedIn
          ? '/main_screen'
          : '/on_boarding_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: SizeConfig.scaleHeight(170),
              width: SizeConfig.scaleWidth(170),
              alignment: Alignment.center,
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
              child: SvgPicture.asset(
                'assets/svg/logo.svg',
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            AppTextWidget(
              AppLocalizations.of(context)!.app_name,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(24),
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
