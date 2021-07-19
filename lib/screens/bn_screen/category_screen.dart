import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/currency_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWithDetailsScreen extends StatefulWidget {
  @override
  _CategoryWithDetailsScreenState createState() => _CategoryWithDetailsScreenState();
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
              fontFamily: 'Montserrat',
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
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    // return CurrencyWidget(
                    //     currency: 'Expenses',
                    //     onTap: () {});
                    return Text('');
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0, color: AppStyleColors.GRAY_COLOR);
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
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    // return CurrencyWidget(
                    //     currency: 'Income',
                    //     onTap: () {});
                    return Text('');
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 0, color: AppStyleColors.GRAY_COLOR);
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
  }
}
