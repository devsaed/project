import 'package:budget_planner/getx/add_operation_getx_controller.dart';
import 'package:budget_planner/models/actions.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/action_widget.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../operation/action_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.scaleHeight(150),
          ),
          Container(
            width: SizeConfig.scaleHeight(260),
            height: SizeConfig.scaleHeight(260),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppStyleColors.SHADOW_COLOR,
                  offset: Offset(0, SizeConfig.scaleHeight(13)),
                  blurRadius: SizeConfig.scaleHeight(11),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: CircularPercentIndicator(
              reverse: false,
              startAngle: 180,
              radius: SizeConfig.scaleHeight(259.6),
              lineWidth: 10.0,
              percent: 765 / 1267,
              restartAnimation: true,
              progressColor: Color(0XFF472FC8),
              backgroundColor: Colors.white,
              animation: true,
              onAnimationEnd: () {},
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: AppStyleColors.PRIMARY_TEXT_COLOR,
                            fontSize: SizeConfig.scaleTextFont(18),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ("765"),
                          style: TextStyle(
                            color: AppStyleColors.PRIMARY_TEXT_COLOR,
                            fontFamily: 'Montserrat',
                            fontSize: SizeConfig.scaleTextFont(40),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(0.3),
                  ),
                  AppTextWidget(
                    AppLocalizations.of(context)!.spent_today,
                    color: AppStyleColors.PRIMARY_TEXT_COLOR,
                    fontSize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(13),
                  ),
                  Divider(
                    indent: SizeConfig.scaleWidth(33),
                    endIndent: SizeConfig.scaleWidth(33),
                    color: AppStyleColors.SHADOW_COLOR,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(11),
                  ),
                  AppTextWidget(
                    AppLocalizations.of(context)!.balance_for_today,
                    color: AppStyleColors.GRAY_COLOR,
                    fontSize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(6),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(13),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                        TextSpan(
                          text: ("1267"),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(23.1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: SizeConfig.scaleHeight(25),
                top: SizeConfig.scaleHeight(40)),
            alignment: AlignmentDirectional.centerStart,
            child: AppTextWidget(
              AppLocalizations.of(context)!.last_actions,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(20),
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
            ),
          ),
          lastOperation.isNotEmpty
              ? Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(SizeConfig.scaleHeight(8)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, SizeConfig.scaleHeight(5)),
                              blurRadius: SizeConfig.scaleHeight(18),
                              spreadRadius: 0,
                              color: AppStyleColors.SHADOW_COLOR,
                            )
                          ]),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                left: SizeConfig.scaleWidth(12),
                                right: SizeConfig.scaleWidth(12),
                                top: SizeConfig.scaleHeight(10),
                                bottom: SizeConfig.scaleHeight(27),
                              ),
                              itemCount: lastOperation.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 0,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ActionWidget(
                                  onTap: () {},
                                  operation: lastOperation[index],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.scaleWidth(15), vertical: SizeConfig.scaleHeight(25)),
                            child: AppElevatedButton(
                                text: AppLocalizations.of(context)!.see_more,
                                onPressed: () {
                                  navigationToActionScreen(context: context);
                                }),
                          )
                        ],
                      )),
                )
              : Container(),
        ],
      ),
    );
  }

  navigationToActionScreen({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActionsScreen()));
  }

  List<Operation> get lastOperation {
    return ActionsGetxController.to.getTheLastActions();
  }
}
