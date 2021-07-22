import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AppTextWidget(
          AppLocalizations.of(context)!.about_app,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.scaleHeight(170),
                  width: SizeConfig.scaleWidth(170),
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(42), vertical: SizeConfig.scaleHeight(24)),
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
                      ]),
                  child: Center(
                    child: SvgPicture.asset('assets/svg/logo.svg'),
                  ),
                ),
                AppTextWidget(
                  AppLocalizations.of(context)!.app_name,
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.scaleTextFont(24),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(18),
                ),
                AppTextWidget(
                  AppLocalizations.of(context)!.ggateway,
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.scaleTextFont(18),
                ),
                SizedBox(
                  height: 6,
                ),
                AppTextWidget(
                  AppLocalizations.of(context)!.my_name,
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.scaleTextFont(15),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: 0,
            start: 0,
            bottom: SizeConfig.scaleHeight(20),
            child: AppTextWidget(
              'V 1.0.0',
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.w300,
              fontSize: SizeConfig.scaleTextFont(15),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
