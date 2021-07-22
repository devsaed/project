import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:budget_planner/widgets/tips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.scaleHeight(113),
          ),
          LoginTextFieldWidget(
            hint: AppLocalizations.of(context)!.search,
            controller: controller,
            prefixIcon: Icons.search_rounded,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(24),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SizeConfig.scaleWidth(17),
                crossAxisSpacing: SizeConfig.scaleHeight(10),
                childAspectRatio: SizeConfig.scaleWidth(182) / SizeConfig.scaleHeight(230),
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
