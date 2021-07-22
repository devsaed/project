import 'package:budget_planner/getx/add_operation_getx_controller.dart';
import 'package:budget_planner/screens/operation/operation_details_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/action_widget.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActionsScreen extends StatefulWidget {
  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppTextWidget(
            AppLocalizations.of(context)!.action,
            color: AppStyleColors.PRIMARY_TEXT_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.scaleTextFont(20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
          child: Column(
            children: [
              LoginTextFieldWidget(
                hint: AppLocalizations.of(context)!.search,
                controller: controller,
                prefixIcon: Icons.search_rounded,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20), vertical: SizeConfig.scaleHeight(20)),
                  child: GetBuilder<ActionsGetxController>(
                      builder: (ActionsGetxController controller) {
                    return ListView.separated(
                      itemCount: controller.operations.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return ActionWidget(
                          operation: controller.operations.elementAt(index),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OperationDetailsScreen(
                                  operation: controller.operations.elementAt(index),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                            height: 0, color: AppStyleColors.GRAY_COLOR);
                      },
                    );
                  }),
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
                ),
              ),
            ],
          ),
        ));
  }
}
