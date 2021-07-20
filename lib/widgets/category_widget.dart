import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
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
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                category.name[0],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppStyleColors.PRIMARY_COLOR,
              radius: 20,
            ),
            SizedBox(width: 15),
            Text(category.name),
          ],
        ),
      ),
    );
  }
}
