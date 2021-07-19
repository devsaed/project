import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:budget_planner/widgets/tips_widget.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 113,
          ),
          LoginTextFieldWidget(
            hint: 'Search',
            controller: controller,
            errorMsg: null,
            prefixIcon: Icons.search_rounded,
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 10,
                childAspectRatio: 182 / 230,
              ),
              itemBuilder: (context, index) {
                return TipsWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
