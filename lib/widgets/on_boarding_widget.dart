import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String svgIcon;

  OnBoardingWidget({
    required this.title,
    required this.subTitle,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.scaleHeight(45)),
      child: Column(
        children: [
          AppTextWidget(
            title,
            fontSize: SizeConfig.scaleTextFont(20),
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(10),
          ),
          AppTextWidget(
            subTitle,
            color: AppStyleColors.GRAY_COLOR,
            textAlign: TextAlign.center,
            fontSize: SizeConfig.scaleTextFont(15),
          ),
          Expanded(
            child: SvgPicture.asset('assets/svg/$svgIcon.svg'),
          )
        ],
      ),
    );
  }
}
