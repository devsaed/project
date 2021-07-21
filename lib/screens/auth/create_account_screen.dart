import 'package:budget_planner/database/controllers/user_db_controller.dart';
import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/models/user.dart';
import 'package:budget_planner/screens/auth/create_account_success.dart';
import 'package:budget_planner/screens/currency_screen.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/create_account_text_filed.dart';
import 'package:budget_planner/widgets/header_widget.dart';
import 'package:budget_planner/widgets/main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bin_code_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
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
    SizeConfig().init(context);
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
              HeaderWidget(AppLocalizations.of(context)!.get_start, 'wallet'),
              SizedBox(height: 11),
              AppTextWidget(
                AppLocalizations.of(context)!.create_account_message,
                color: AppStyleColors.GRAY_COLOR,
                textAlign: TextAlign.center,
                fontSize: SizeConfig.scaleTextFont(15),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(15),
                ),
                margin: EdgeInsets.only(
                  top: SizeConfig.scaleHeight(20),
                  bottom: SizeConfig.scaleHeight(100),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.scaleHeight(25),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, SizeConfig.scaleHeight(10)),
                      color: AppStyleColors.SHADOW_COLOR,
                      blurRadius: SizeConfig.scaleHeight(18),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CreateAccountTextField(
                      controller: userNameController,
                      hint: AppLocalizations.of(context)!.none,
                      prefix: AppLocalizations.of(context)!.name,
                    ),
                    Divider(
                      height: 0,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                    CreateAccountTextField(
                      controller: emailController,
                      hint: AppLocalizations.of(context)!.none,
                      prefix: AppLocalizations.of(context)!.email,
                      inputType: TextInputType.emailAddress,
                    ),
                    Divider(
                      height: 0,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.currency,
                      value: currency == null ? '' : currency!.nameEn,
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
                    Divider(
                      height: 0,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                    CreateAccountTextField(
                      controller: dallyLimitController,
                      hint: '500',
                      prefix: AppLocalizations.of(context)!.daily_limit,
                      inputType: TextInputType.number,
                    ),
                    Divider(
                      height: 0,
                      color: AppStyleColors.GRAY_COLOR,
                    ),
                    MainContainerWidget(
                        title: AppLocalizations.of(context)!.set_your_pin,
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
              AppElevatedButton(
                text: AppLocalizations.of(context)!.create_account,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () async {
                  await performRegister();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  register() async {
    User newUser = user;
    int newUserId = await UserDbController().create(newUser);
    if (newUserId != 0) {
      newUser.id = newUserId;
      showSnackBar(context, message: 'Account Created Successfully!');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccountSuccessScreen(),
        ));
    }
  }

  bool checkData() {
    if (userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        dallyLimitController.text.isNotEmpty &&
        binCode != null &&
        currency != null) {
      return true;
    }

    showSnackBar(context, message: AppLocalizations.of(context)!.empty_field_error , error: true);
    return false;
  }

  User get user {
    User user = User();
    user.name = userNameController.text;
    user.email = emailController.text;
    user.dayLimit = double.parse(dallyLimitController.text);
    user.pin = int.parse(binCode!);
    user.currencyId = currency!.id;
    return user;
  }
}
