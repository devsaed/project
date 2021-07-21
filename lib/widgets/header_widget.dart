import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_text_widget.dart';

class HeaderWidget extends StatelessWidget {

  String label;
  String svgIcon;

  HeaderWidget(this.label, this.svgIcon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.scaleHeight(120),
          width: SizeConfig.scaleHeight(120),
          padding: EdgeInsets.all(SizeConfig.scaleHeight(30)),
          child: SvgPicture.asset('assets/svg/$svgIcon.svg'),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, SizeConfig.scaleHeight(10)),
                color: AppStyleColors.SHADOW_COLOR,
                blurRadius: SizeConfig.scaleHeight(18),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.scaleHeight(13)),
        AppTextWidget(
          label,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
      ],
    );
  }
}
