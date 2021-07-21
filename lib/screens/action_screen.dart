import 'package:budget_planner/getx/add_operation_getx_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/action_widget.dart';
import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [

          LoginTextFieldWidget(
            hint: 'Search',
            controller: controller,
            errorMsg: null,
            prefixIcon: Icons.search_rounded,

          ),


          Expanded(
            child: Container(
              margin:
              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder<ActionsGetxController>(
                builder: (ActionsGetxController controller) {
                  return ListView.separated(
                    itemCount: controller.operations.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ActionWidget(
                        operation: controller.operations[index],
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 0, color: AppStyleColors.GRAY_COLOR);
                    },
                  );
                }
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: AppStyleColors.SHADOW_COLOR,
                    blurRadius: 18,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
