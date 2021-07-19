import 'package:budget_planner/utils/app_style_colors.dart';
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
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        child: AppTextWidget(
          number,
          color: Colors.white,
          fontFamily: 'montserrat',
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          color: isFilled ? AppStyleColors.PRIMARY_COLOR : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                color: Colors.black.withOpacity(0.16),
                spreadRadius: 0,
                blurRadius: 18)
          ],
        ),
      ),
    );
  }
}
