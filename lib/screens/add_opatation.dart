import 'package:budget_planner/screens/bn_screen/category_screen.dart';
import 'package:budget_planner/screens/category_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/category_type_widget.dart';
import 'package:budget_planner/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'currency_screen.dart';

class AddOperation extends StatefulWidget {
  @override
  _AddOperationState createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> {
  String? cur;
  String? category;
  DateTime? _pickedDateValue;
  String? _pickedDate;

  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.arrow_upward_sharp,color: Colors.red.shade900,),
                    index: 0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryTypeWidget(
                    title: 'Income',
                    icon: Icon(Icons.arrow_downward_rounded,color: Colors.green.shade900,),
                    index: 0,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: AppStyleColors.SHADOW_COLOR,
                          blurRadius: 18,
                          spreadRadius: 0),
                    ]),
                child: Column(
                  children: [
                    ProfileWidget(
                      title: 'Category',
                      value: category,
                      onTap: () async {
                        String c = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ),
                        );
                        setState(() {
                          category = c;
                        });
                      },
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
                    ProfileWidget(
                      title: 'Date',
                      value: _pickedDate ?? 'D/M/Y',
                      onTap: () async {
                        await pickDate();
                        setState(() {});
                      },
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
                    ProfileWidget(
                      title: 'Currency',
                      value: cur,
                      iconData: Icons.arrow_forward_ios,
                      onTap: () async {
                        String c = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrencyScreen(),
                          ),
                        );
                        setState(() {
                          cur = c;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 112,
                padding: EdgeInsets.all(15),
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
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  controller: null,
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppStyleColors.PRIMARY_TEXT_COLOR,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Note',
                    border: InputBorder.none,
                    errorStyle: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.red.shade900,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.normal,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      _pickedDate = format.format(dateTime);
      print('Date: $_pickedDate');
    }
  }
}
