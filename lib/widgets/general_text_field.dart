import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon? prefix;
  final double height;
  TextAlign textAlign;

  GeneralTextField({
    required this.controller,
    required this.hint,
    this.prefix,
    this.textAlign = TextAlign.start,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0, 0),
              color: AppStyleColors.SHADOW_COLOR,
              blurRadius: SizeConfig.scaleHeight(6),
              spreadRadius: 0),
        ],
      ),
      child: TextField(
        minLines: null,
        maxLines: null,
        expands: true,
        controller: controller,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
            color: AppStyleColors.PRIMARY_TEXT_COLOR,
            fontSize: SizeConfig.scaleTextFont(20)),
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            errorStyle: TextStyle(
                color: Colors.red.shade900,
                fontFamily: 'montserrat',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.normal),
            hintStyle: TextStyle(
                color: AppStyleColors.GRAY_COLOR,
                fontFamily: 'montserrat',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(14),
                top: SizeConfig.scaleHeight(20))),
      ),
    );
  }
}
