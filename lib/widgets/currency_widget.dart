import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  final Currency currency;
  final void Function() onTap;

  CurrencyWidget({required this.currency, required this.onTap});

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
                currency.nameEn[0],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppStyleColors.PRIMARY_COLOR,
              radius: 20,
            ),
            SizedBox(width: 15),
            Text(currency.nameEn),
          ],
        ),
      ),
    );
  }
}
