import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/models/category.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/category_type_widget.dart';
import 'package:budget_planner/widgets/general_text_field.dart';
import 'package:budget_planner/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> with Helpers {
  int expensesSelected = 0;
  int incomeSelected = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(20),
            end: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(80),
          ),
          child: Column(
            children: [
              HeaderWidget(AppLocalizations.of(context)!.add_category, 'wallet'),
              SizedBox(height: SizeConfig.scaleHeight(50)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
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
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.incomes,
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
              SizedBox(height: SizeConfig.scaleHeight(10),),
              GeneralTextField(
                  controller: textEditingController,
                  hint: AppLocalizations.of(context)!.enter_category_name,
                  height: SizeConfig.scaleHeight(67)),

              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),

              AppElevatedButton(
                text: AppLocalizations.of(context)!.add,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () async {
                  await performSave();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future performSave() async {
    if (checkData()) {
      await save();
      Navigator.pop(context);
    }
  }

  bool checkData() {
    if (textEditingController.text.isNotEmpty && categorySelect()) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool created = await CategoryGetxController.to.createCategory(category);
    String message =
        created ?  AppLocalizations.of(context)!.category_created_successfully : AppLocalizations.of(context)!.category_created_field;
    showSnackBar(context, message: message, error: !created);
  }

  Category get category {
    Category category = Category();
    category.name = textEditingController.text;
    category.expense = expensesSelected == 1;
    return category;
  }

  bool categorySelect() {
    if (incomeSelected == 0) {
      if (expensesSelected == 0) {
        return false;
      }
    }
    return true;
  }
}
