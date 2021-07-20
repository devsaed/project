import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/create_account_text_filed.dart';
import 'package:budget_planner/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../bin_code_screen.dart';
import '../currency_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController dallyLimitController;
  Currency? currency;
  String? binCode;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    dallyLimitController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    dallyLimitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 120,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(top: 103, bottom: 13),
          child: SvgPicture.asset('assets/svg/profile.svg'),
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
        ),
        AppTextWidget(
          'user name',
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.all(20),
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
          child: Column(
            children: [
              CreateAccountTextField(
                controller: userNameController,
                hint: user.name,
                prefix: 'Name:',
              ),
              Divider(
                height: 0,
                color: AppStyleColors.GRAY_COLOR,
              ),
              CreateAccountTextField(
                controller: emailController,
                hint: SharedPrefController().getUser().email,
                inputType: TextInputType.emailAddress,
                prefix: 'Email Address:',
              ),
              Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
              ProfileWidget(
                title: 'Currency',
                value: user.currencyId.toString(),
                iconData: Icons.arrow_forward_ios,
                onTap: () async {
                  Currency selectedCurrency = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyScreen(),
                    ),
                  );
                  setState(() {
                    currency = selectedCurrency;
                  });
                },
              ),
              Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
              CreateAccountTextField(
                controller: dallyLimitController,
                hint: user.dayLimit.toString(),
                prefix: 'Daily limit',
                inputType: TextInputType.number,
              ),
              Divider(height: 0, color: AppStyleColors.GRAY_COLOR),
              ProfileWidget(
                  title: 'Set your pin',
                  value: binCode,
                  iconData: Icons.arrow_forward_ios,
                  onTap: () async {
                    String code = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BinCodeScreen(),
                      ),
                    );
                    setState(() {
                      binCode = code;
                    });
                  }),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: AppElevatedButton(
            text: 'Save',
            fontWeight: FontWeight.bold,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  User get user {
    User user = SharedPrefController().getUser();
    return user;
  }
}
