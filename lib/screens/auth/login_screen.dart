import 'package:budget_planner/database/controllers/user_db_controller.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/header_widget.dart';
import 'package:budget_planner/widgets/login_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              HeaderWidget(AppLocalizations.of(context)!.login, 'wallet'),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              AppTextWidget(
                AppLocalizations.of(context)!.login_msg,
                color: AppStyleColors.GRAY_COLOR,
                textAlign: TextAlign.center,
                fontSize: SizeConfig.scaleTextFont(15),
              ),
              SizedBox(height: SizeConfig.scaleHeight(50)),
              LoginTextFieldWidget(
                hint: AppLocalizations.of(context)!.email,
                controller: emailEditingController,
              ),
              SizedBox(height: SizeConfig.scaleHeight(15)),
              LoginTextFieldWidget(
                hint: AppLocalizations.of(context)!.pin,
                controller: pinCodeEditingController,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
              AppElevatedButton(
                text: AppLocalizations.of(context)!.login,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () async {
                  await performLogin();
                },
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.create_account_question,
                  style: TextStyle(
                    color: AppStyleColors.GRAY_COLOR,
                    fontFamily: 'montserrat',
                    fontSize: SizeConfig.scaleTextFont(15),
                  ),
                  children: [
                    TextSpan(
                      recognizer: recognizer,
                      text: AppLocalizations.of(context)!.create_account,
                      style: TextStyle(
                        color: AppStyleColors.PRIMARY_TEXT_COLOR,
                        fontFamily: 'montserrat',
                        fontSize: SizeConfig.scaleTextFont(15),
                      ),
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

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailEditingController.text.isNotEmpty && pinCodeEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future login() async {
    User? user = await UserDbController().login(email: emailEditingController.text, pin: pinCodeEditingController.text);
    if (user != null) {
      showSnackBar(context, message: AppLocalizations.of(context)!.login_successfully);
      SharedPrefController().save(user);
      Navigator.pushNamedAndRemoveUntil(context, '/main_screen', (route) => false);
    } else{
      showSnackBar(context, message: AppLocalizations.of(context)!.invalid_email_or_pin, error: true);
    }
  }
}
