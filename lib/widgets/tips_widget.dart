import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_text_widget.dart';

class TipsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            height: 157,
            width: 182,
            child: SvgPicture.asset(
              'assets/svg/on_boarding_image2.svg',
            ),
          ),

          AppTextWidget(
            'How to save a budget 10 tips',
            color: AppStyleColors.PRIMARY_TEXT_COLOR,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6,
          ),
          AppTextWidget(
            '3 month ago ',
            color: AppStyleColors.GRAY_COLOR,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.normal,
            fontSize: 13,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
