import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final void Function()? onTap;

  ProfileWidget({
    required this.title,
    this.value,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        print('nothing!');
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 23),

        child: Row(
          children: [
            AppTextWidget(
              title,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: AppStyleColors.BLOCK_COLOR,
            ),
            Spacer(),
            AppTextWidget(
              value??'',
              fontFamily: 'montserrat',
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: AppStyleColors.GRAY_COLOR,
            ),
            iconData != null
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: AppStyleColors.GRAY_COLOR,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
