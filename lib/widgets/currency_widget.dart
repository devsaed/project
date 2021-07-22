import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_widget.dart';

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
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppStyleColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10)),
              child: AppTextWidget(
                SharedPrefController().languageCode == 'ar' ? currency.nameAr[0]: currency.nameEn[0],
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(width: 15),
            Text(
                SharedPrefController().languageCode == 'ar' ? currency.nameAr: currency.nameEn
            ),
          ],
        ),
      ),
    );
  }
}
