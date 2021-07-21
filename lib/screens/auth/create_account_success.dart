import 'package:budget_planner/screens/main_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccountSuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<CreateAccountSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false);
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: SizeConfig.scaleHeight(170),
              width: SizeConfig.scaleWidth(170),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaleWidth(42),
                vertical: SizeConfig.scaleHeight(24),
              ),
              margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(30)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppStyleColors.SHADOW_COLOR,
                      offset: Offset(0, SizeConfig.scaleHeight(10)),
                      blurRadius: SizeConfig.scaleHeight(18),
                      spreadRadius: 0)
                ],
              ),
              child: Center(
                child: SvgPicture.asset('assets/svg/like.svg'),
              ),
            ),
            AppTextWidget(
              AppLocalizations.of(context)!.congratulations,
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(24),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            AppTextWidget(
              AppLocalizations.of(context)!.you_have_registered,
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.w300,
              fontSize: SizeConfig.scaleTextFont(18),
            ),
          ],
        ),
      ),
    );
  }
}
