import 'package:budget_planner/getx/currency_getx_controller.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/currency_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AppTextWidget(
          AppLocalizations.of(context)!.currency,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleHeight(20),
        ),
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(100),
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, SizeConfig.scaleHeight(10)),
              color: AppStyleColors.SHADOW_COLOR,
              blurRadius: SizeConfig.scaleHeight(18),
              spreadRadius: 0,
            ),
          ],
        ),
        child: GetBuilder<CurrencyGetxController>(
          builder: (CurrencyGetxController controller) {
            return ListView.separated(
              itemCount: controller.currencies.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CurrencyWidget(
                  currency: controller.currencies[index],
                  onTap: () {
                    popScreen(controller.currencies[index], context);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 0, color: AppStyleColors.GRAY_COLOR);
              },
            );
          },
        ),
      ),
    );
  }

  popScreen(Currency currency, BuildContext context) {
    Navigator.pop(context, currency);
  }
}
