import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AppTextWidget(
          'About',
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 170,
                  width: 170,
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 24),
                  margin: EdgeInsets.only(bottom: 29),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 10),
                            blurRadius: 18,
                            spreadRadius: 0)
                      ]),
                  child: Center(
                    child: SvgPicture.asset('assets/svg/logo.svg'),
                  ),
                ),
                AppTextWidget(
                  'Budget Planner',
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                SizedBox(
                  height: 18,
                ),
                AppTextWidget(
                  'PalLancer - Flutter',
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                AppTextWidget(
                  'user name',
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: 0,
            start: 0,
            bottom: 20,
            child: AppTextWidget(
              'V 1.0.0',
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w300,
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
