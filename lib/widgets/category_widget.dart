import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;
  final void Function() onTap;

  CategoryWidget({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleWidth(20)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppStyleColors.PRIMARY_COLOR,
              radius: SizeConfig.scaleHeight(20),
              child: AppTextWidget(
                category.name[0].toUpperCase(),
                color: Colors.white,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: SizeConfig.scaleWidth(20)),
            AppTextWidget(
              category.name,
              color: Colors.black,
              fontSize: SizeConfig.scaleTextFont(15),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
