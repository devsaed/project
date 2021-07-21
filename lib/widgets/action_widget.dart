import 'package:budget_planner/models/actions.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
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
            CircleAvatar(
              child: Text(
                operation.categoryId.toString(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppStyleColors.PRIMARY_COLOR,
              radius: 20,
            ),
            SizedBox(width: 15),
            Text(operation.categoryId.toString()),
            Spacer(),
            Text(operation.amount.toString())
          ],
        ),
      ),
    );
  }
}
