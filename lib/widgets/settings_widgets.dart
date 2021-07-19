import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';
import 'app_text_widget.dart';

class SettingsWidget extends StatelessWidget {
  final String label;
  final Icon leading;
  final IconData? trailingIcon;
  final Color fillColor;
  final Color labelColor;
  final Color? boarderColor;

  SettingsWidget({
    required this.label,
    required this.leading,
    this.trailingIcon,
    this.fillColor = Colors.white,
    this.boarderColor,
    this.labelColor = AppStyleColors.PRIMARY_TEXT_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          leading,
          SizedBox(
            width: 15,
          ),
          AppTextWidget(
            label,
            color: labelColor,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          Spacer(),
          trailingIcon != null
              ? Icon(
                  trailingIcon,
                  size: 13,
                  color: AppStyleColors.GRAY_COLOR,
                )
              : Container(),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fillColor,
          border: boarderColor != null
              ? Border.all(color: boarderColor!)
              : Border.all(color: Colors.white),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppStyleColors.SHADOW_COLOR,
                offset: Offset(0, 3),
                blurRadius: 7,
                spreadRadius: 0)
          ]),
    );
  }
}
