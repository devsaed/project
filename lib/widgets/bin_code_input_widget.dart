import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class BinCodeInputWidget extends StatelessWidget {
  late final String number;
  late final bool isFilled;

  BinCodeInputWidget({
    required this.number,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.scaleHeight(45),
      width: SizeConfig.scaleWidth(45),
      alignment: Alignment.center,
      child: AppTextWidget(
        number,
        color: Colors.white,
        fontSize: SizeConfig.scaleTextFont(23),
        fontWeight: FontWeight.bold,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaleWidth(6),
        vertical: SizeConfig.scaleHeight(6),
      ),
      decoration: BoxDecoration(
        color: isFilled ? AppStyleColors.PRIMARY_COLOR : Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, SizeConfig.scaleHeight(10)),
            color: AppStyleColors.SHADOW_COLOR,
            spreadRadius: 0,
            blurRadius: SizeConfig.scaleHeight(18),
          )
        ],
      ),
    );
  }
}
