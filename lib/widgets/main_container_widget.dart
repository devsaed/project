import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class MainContainerWidget extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final void Function()? onTap;

  MainContainerWidget({
    required this.title,
    this.value,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            print('nothing!');
          },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(23)),
        child: Row(
          children: [
            AppTextWidget(
              title,
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.scaleTextFont(15),
              color: AppStyleColors.BLOCK_COLOR,
            ),
            Spacer(),
            AppTextWidget(
              value ?? '',
              fontWeight: FontWeight.normal,
              fontSize: SizeConfig.scaleTextFont(15),
              color: AppStyleColors.GRAY_COLOR,
            ),
            iconData != null
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: SizeConfig.scaleHeight(13),
                    color: AppStyleColors.GRAY_COLOR,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
