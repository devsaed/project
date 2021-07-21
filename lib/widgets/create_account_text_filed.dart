import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_text_widget.dart';

class CreateAccountTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? errorMsg;
  final IconData? suffix;
  final String? prefix;
  final TextInputType inputType;

  CreateAccountTextField(
      {required this.hint,
      required this.controller,
      this.errorMsg,
      this.suffix,
      this.prefix,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(10)),
      child: Row(
        children: [
          AppTextWidget(
            prefix ?? '',
            color: Colors.black,
            fontSize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.w500,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                // hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(
                  color: AppStyleColors.GRAY_COLOR,
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontFamily: 'montserrat',
                ),
              ),
              style: TextStyle(
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                fontFamily: 'montserrat',
              ),

            ),
          ),
        ],
      ),
    );
  }
}
