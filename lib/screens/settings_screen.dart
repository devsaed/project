import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          'Settings',
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SettingsWidget(
              label: 'About App',
              leading: Icon(Icons.info),
              trailingIcon: Icons.arrow_forward_ios,
            ),
            SettingsWidget(
              label: 'Language',
              leading: Icon(Icons.language_outlined),
              trailingIcon: Icons.arrow_forward_ios,
            ),
            SettingsWidget(
              label: 'About App',
              leading: Icon(Icons.logout),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25,bottom: 15),
              child: AppTextWidget(
                'Account & data',
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                fontFamily: 'montserrat',
                fontSize: 15,
                textAlign: TextAlign.center,
              ),
            ),


            SettingsWidget(
              label: 'Clear account data',
              leading: Icon(Icons.delete_forever,color: Colors.red,),
              labelColor: Colors.red.shade700,
              boarderColor: Colors.red.shade700,
            ),

            SettingsWidget(
              label: 'Remove account',
              leading: Icon(Icons.person_remove,color: Colors.white,),
              labelColor: Colors.white,
              boarderColor: Colors.red.shade700,
              fillColor: Colors.red.shade700,
            ),


          ],
        ),
      ),
    );
  }
}
