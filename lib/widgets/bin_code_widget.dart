import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class BinCodeWidget extends StatelessWidget {
  final String? number;
  final void Function() onTap;
  final Color bgColor;
  final IconData? iconData;

  BinCodeWidget({
    this.number,
    required this.onTap,
    this.bgColor = Colors.white,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: SizeConfig.scaleHeight(70),
        width: SizeConfig.scaleWidth(70),
        alignment: Alignment.center,
        child: iconData == null
            ? AppTextWidget(
                number!,
                color: AppStyleColors.PRIMARY_COLOR,
                fontSize: SizeConfig.scaleTextFont(23),
                fontWeight: FontWeight.bold,
              )
            : Icon(
                iconData,
                color: Colors.white,
                size: SizeConfig.scaleHeight(20),
              ),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(16),
          vertical: SizeConfig.scaleHeight(16),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
          boxShadow: [
            BoxShadow(
              offset: Offset(
                0,
                SizeConfig.scaleHeight(10),
              ),
              color: AppStyleColors.SHADOW_COLOR,
              spreadRadius: 0,
              blurRadius: SizeConfig.scaleHeight(18),
            )
          ],
        ),
      ),
    );
  }
}
