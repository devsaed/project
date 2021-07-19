import 'package:budget_planner/utils/app_style_colors.dart';
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 70,
          width: 70,
          alignment: Alignment.center,
          child: iconData == null
              ? AppTextWidget(
                  number!,
                  color: AppStyleColors.PRIMARY_COLOR,
                  fontFamily: 'montserrat',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                )
              : Icon(
                  iconData,
                  color: Colors.white,
                  size: 20,
                ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: 0,
                  blurRadius: 18)
            ],
          ),
        ),
      ),
    );
  }
}
