import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/models/actions.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final Operation operation;
  final void Function() onTap;

  ActionWidget({required this.operation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppStyleColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10)),
              child: AppTextWidget(
                CategoryGetxController.to
                    .getCategoryName(operation.categoryId)[0]
                    .toUpperCase(),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  CategoryGetxController.to
                      .getCategoryName(operation.categoryId),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppStyleColors.PRIMARY_TEXT_COLOR,
                ),
                AppTextWidget(
                  operation.notes,
                  fontSize: 15,
                  color: Colors.grey,
                )
              ],
            ),
            Spacer(),
            AppTextWidget(
              operation.expense
                  ? '- \$' + operation.amount.toString()
                  : '+ \$' + operation.amount.toString(),
              fontSize: 15,
              color: operation.expense ? Colors.red.shade900 : Colors.green,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
