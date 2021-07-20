import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  CategoryGetxController controller = Get.find();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AppTextWidget(
          'Categories',
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            color: AppStyleColors.PRIMARY_COLOR,
            onPressed: () {
              Navigator.pushNamed(context, '/create_category_screen');
            },
          ),
        ],
      ),
      body: GetBuilder(
        builder: (CategoryGetxController controller) {
          List<Category> expenses =
              controller.category.where((element) => element.expense).toList();
          List<Category> income =
              controller.category.where((element) => !element.expense).toList();
          return Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 15),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppStyleColors.TAB_BAR_BG,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: AppStyleColors.PRIMARY_COLOR,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: 'Expenses'),
                    Tab(text: 'Income'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 15),
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
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 10),
                              color: AppStyleColors.SHADOW_COLOR,
                              blurRadius: 18,
                              spreadRadius: 0),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.separated(
                        itemCount: income.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              category: income[index], onTap: () {});
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              height: 0, color: AppStyleColors.GRAY_COLOR);
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.scaleHeight(25),
                        ),
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
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  popScreen({required String category, required BuildContext context}) {
    Navigator.pop(context, category);
  }
}
