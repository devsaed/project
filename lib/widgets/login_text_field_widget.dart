import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginTextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String? errorMsg;
  final IconData? prefixIcon;
  final TextInputType textInputType;

  LoginTextFieldWidget(
      {required this.hint,
      required this.controller,
      this.errorMsg,
      this.prefixIcon,
      this.textInputType = TextInputType.text,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.scaleWidth(45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.scaleWidth(10)),
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
        keyboardType: textInputType,
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontSize: SizeConfig.scaleTextFont(15),
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: AppStyleColors.PRIMARY_TEXT_COLOR,) : null,
          errorText: errorMsg,
          border: InputBorder.none,
          hintText: hint,
          errorStyle: TextStyle(
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.normal,
            color: Colors.red.shade900,
          ),
          hintStyle: TextStyle(
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.normal,
            color: AppStyleColors.GRAY_COLOR,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.scaleWidth(20),
            vertical: SizeConfig.scaleHeight(10),
          ),
        ),
      ),
    );
  }
}
