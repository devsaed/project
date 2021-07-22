import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/getx/currency_getx_controller.dart';
import 'package:budget_planner/models/actions.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/category_type_widget.dart';
import 'package:budget_planner/widgets/general_text_field.dart';
import 'package:budget_planner/widgets/header_widget.dart';
import 'package:budget_planner/widgets/main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OperationDetailsScreen extends StatelessWidget {
  final Operation operation;

  OperationDetailsScreen({required this.operation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.scaleWidth(20),
            left: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(80),
          ),
          child: Column(
            children: [
              HeaderWidget(
                  AppLocalizations.of(context)!.add_operation, 'wallet'),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              GeneralTextField(
                controller: null,
                hint: operation.amount.toString(),
                enable: false,
                hintColor: AppStyleColors.PRIMARY_TEXT_COLOR,
                hintSize: SizeConfig.scaleTextFont(30),
                height: SizeConfig.scaleHeight(67),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    index: operation.expense ? 1 : 0,
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                      title: AppLocalizations.of(context)!.incomes,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green.shade900,
                      ),
                      index: !operation.expense ? 2 : 0),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        color: AppStyleColors.SHADOW_COLOR,
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0),
                  ],
                ),
                child: Column(
                  children: [
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.categories,
                      value: CategoryGetxController.to
                          .getCategoryName(operation.categoryId),
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.date,
                      value: operation.date,
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.currency,
                      value: CurrencyGetxController.to
                          .getCurrencyName(operation.id),
                      iconData: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
              GeneralTextField(
                enable: false,
                height: SizeConfig.scaleHeight(112),
                hintColor: Colors.grey,
                hint: operation.notes,
                controller: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
