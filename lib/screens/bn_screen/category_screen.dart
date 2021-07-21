import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/category_widget.dart';
import 'package:budget_planner/widgets/currency_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryWithDetailsScreen extends StatefulWidget {
  @override
  _CategoryWithDetailsScreenState createState() =>
      _CategoryWithDetailsScreenState();
}

class _CategoryWithDetailsScreenState extends State<CategoryWithDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder(
      builder: (CategoryGetxController controller) {
        List<Category> expenses =
            controller.category.where((element) => element.expense).toList();
        List<Category> income =
            controller.category.where((element) => !element.expense).toList();
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.scaleHeight(110),
            ),
            Container(
              height: SizeConfig.scaleHeight(40),
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppStyleColors.TAB_BAR_BG,
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
              ),
              child: TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: AppStyleColors.PRIMARY_COLOR,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(40)),
                ),
                labelStyle: TextStyle(
                  fontSize: SizeConfig.scaleTextFont(13),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.expenses),
                  Tab(text: AppLocalizations.of(context)!.incomes),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(10)),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(20),
                        vertical: SizeConfig.scaleHeight(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15)),
                    child: ListView.separated(
                      itemCount: expenses.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: expenses[index],
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                            height: 0, color: AppStyleColors.GRAY_COLOR);
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.scaleHeight(25)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: AppStyleColors.SHADOW_COLOR,
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(20),
                        vertical: SizeConfig.scaleHeight(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15)),
                    child: ListView.separated(
                      itemCount: income.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: income[index],
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 0,
                          color: AppStyleColors.GRAY_COLOR,
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(25)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0, SizeConfig.scaleHeight(10)),
                            color: AppStyleColors.SHADOW_COLOR,
                            blurRadius: SizeConfig.scaleHeight(18),
                            spreadRadius: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
