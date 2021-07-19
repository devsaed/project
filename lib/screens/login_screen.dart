import 'package:budget_planner/database/controllers/user_db_controller.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController emailEditingController;
  late TextEditingController pinCodeEditingController;
  late TapGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    emailEditingController = TextEditingController();
    pinCodeEditingController = TextEditingController();
    recognizer = TapGestureRecognizer();
    recognizer.onTap = navigateToCreateAccountScreen;
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    pinCodeEditingController.dispose();
    super.dispose();
  }

  navigateToCreateAccountScreen() {
    Navigator.pushNamed(context, '/create_account_screen');
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
              Container(
                height: SizeConfig.scaleHeight(120),
                width: SizeConfig.scaleHeight(120),
                padding: EdgeInsets.all(SizeConfig.scaleHeight(30)),
                child: SvgPicture.asset('assets/svg/wallet.svg'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        color: AppStyleColors.SHADOW_COLOR,
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(13)),
              AppTextWidget(
                'LOGIN',
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.scaleTextFont(20),
              ),
              SizedBox(height: 11),
              AppTextWidget(
                'Enter your email & pin code to login to your account',
                color: AppStyleColors.GRAY_COLOR,
                textAlign: TextAlign.center,
                fontSize: SizeConfig.scaleTextFont(15),
              ),
              SizedBox(height: SizeConfig.scaleHeight(50)),
              LoginTextFieldWidget(
                hint: 'Email address',
                controller: emailEditingController,
              ),
              SizedBox(height: SizeConfig.scaleHeight(15)),
              LoginTextFieldWidget(
                hint: 'Pin code',
                controller: pinCodeEditingController,
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
              AppElevatedButton(
                text: 'Login',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () async{
                  await performLogin();
                },
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account?',
                  style: TextStyle(
                    color: AppStyleColors.GRAY_COLOR,
                    fontFamily: 'montserrat',
                    fontSize: SizeConfig.scaleTextFont(15),
                  ),
                  children: [
                    TextSpan(
                      recognizer: recognizer,
                      text: ' Create Now!',
                      style: TextStyle(
                          color: AppStyleColors.PRIMARY_COLOR,
                          fontFamily: 'montserrat',
                          fontSize: SizeConfig.scaleTextFont(15)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async{
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailEditingController.text.isNotEmpty &&
        pinCodeEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Please, enter required data', error: true);
    return false;
  }

  Future login() async {
    User? user = await UserDbController().login(
        email: emailEditingController.text,
        pin: pinCodeEditingController.text);
    if (user != null) {
      SharedPrefController().save(user);
      Navigator.pushNamedAndRemoveUntil(
          context, '/main_screen', (route) => false);
    }
  }

}
