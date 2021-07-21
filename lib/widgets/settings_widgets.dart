import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'app_text_widget.dart';

class SettingsWidget extends StatelessWidget {
  final String label;
  final Icon leading;
  final IconData? trailingIcon;
  final Color fillColor;
  final Color labelColor;
  final Color? boarderColor;
  final void Function()? onTap;

  SettingsWidget({
    required this.label,
    required this.leading,
    this.trailingIcon,
    this.fillColor = Colors.white,
    this.boarderColor,
    this.onTap,
    this.labelColor = AppStyleColors.PRIMARY_TEXT_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaleHeight(23),
            horizontal: SizeConfig.scaleWidth(20)),
        margin: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(8)),
        child: Row(
          children: [
            leading,
            SizedBox(
              width: SizeConfig.scaleWidth(15),
            ),
            AppTextWidget(
              label,
              color: labelColor,
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.scaleTextFont(15),
            ),
            Spacer(),
            trailingIcon != null
                ? Icon(
                    trailingIcon,
                    size: SizeConfig.scaleHeight(13),
                    color: AppStyleColors.GRAY_COLOR,
                  )
                : Container(),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
          color: fillColor,
          border: boarderColor != null
              ? Border.all(color: boarderColor!)
              : Border.all(color: Colors.white),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppStyleColors.SHADOW_COLOR,
                offset: Offset(0, SizeConfig.scaleHeight(3)),
                blurRadius: SizeConfig.scaleHeight(7),
                spreadRadius: 0)
          ],
        ),
      ),
    );
  }
}
