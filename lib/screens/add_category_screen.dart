import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/category_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  int expensesSelected = 0;
  int incomeSelected = 0;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 80),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                padding: EdgeInsets.all(30),
                child: SvgPicture.asset('assets/svg/wallet.svg'),
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
              SizedBox(height: 13),
              AppTextWidget(
                'Add Category',
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: 'Expenses',
                    index: expensesSelected,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        expensesSelected = 1;
                        incomeSelected = 0;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryTypeWidget(
                    title: 'Income',
                    index: incomeSelected,
                    icon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.green.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        incomeSelected = 2;
                        expensesSelected = 0;
                      });
                    },
                  ),
                ],
              ),

              //TODO refactoring
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 6,
                        spreadRadius: 0),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter category name',
                    border: InputBorder.none,
                    errorStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.red.shade900,
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppElevatedButton(
                text: 'Add',
                // fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
