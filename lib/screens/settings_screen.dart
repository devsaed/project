import 'package:budget_planner/database/controllers/user_db_controller.dart';
import 'package:budget_planner/getx/add_operation_getx_controller.dart';
import 'package:budget_planner/getx/category_getx_controller.dart';
import 'package:budget_planner/getx/language_getx_controller.dart';
import 'package:budget_planner/prefrencess/shared_pref_controller.dart';
import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          AppLocalizations.of(context)!.settings,
          color: AppStyleColors.PRIMARY_TEXT_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.scaleHeight(25), bottom: SizeConfig.scaleHeight(15)),
              child: AppTextWidget(
                AppLocalizations.of(context)!.general,
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                fontSize: SizeConfig.scaleTextFont(15),
                textAlign: TextAlign.center,
              ),
            ),

            SettingsWidget(
              label: AppLocalizations.of(context)!.about_app,
              leading: Icon(Icons.info),
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.pushNamed(context, '/about_screen');
              },
            ),
            SettingsWidget(
              label: AppLocalizations.of(context)!.language,
              leading: Icon(Icons.language_outlined),
              trailingIcon: Icons.arrow_forward_ios,
              onTap: changeLang,
            ),
            SettingsWidget(
              label:  AppLocalizations.of(context)!.logout,
              leading: Icon(Icons.logout),
              onTap: () async {
                await logout(context: context);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.scaleHeight(25), bottom: SizeConfig.scaleHeight(15)),
              child: AppTextWidget(
                AppLocalizations.of(context)!.account_and_data,
                color: AppStyleColors.PRIMARY_TEXT_COLOR,
                fontSize: SizeConfig.scaleTextFont(15),
                textAlign: TextAlign.center,
              ),
            ),
            SettingsWidget(
              label: AppLocalizations.of(context)!.clear_account_data,
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              labelColor: Colors.red.shade700,
              boarderColor: Colors.red.shade700,
              onTap: () async {
                await deleteData(context);
              },
            ),
            SettingsWidget(
              label: AppLocalizations.of(context)!.delete_account,
              leading: Icon(
                Icons.person_remove,
                color: Colors.white,
              ),
              labelColor: Colors.white,
              boarderColor: Colors.red.shade700,
              fillColor: Colors.red.shade700,
              onTap: () async {
                await deleteAccount(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeLang() {
    String newLanguageCode =
        SharedPrefController().languageCode == 'en' ? 'ar' : 'en';
    print(newLanguageCode);
    LanguageGetxController.to.changeLanguage(newLanguageCode);
  }

  Future logout({required BuildContext context}) async {
    bool status = await SharedPrefController().logout();
    if (status) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login_screen', (route) => false);
    }
  }

  Future<void> deleteData(BuildContext context) async {
    bool status = await deleteDialog(
      context: context,
      title: AppLocalizations.of(context)!.clear_account_data,
      content: AppLocalizations.of(context)!.deleted_message,
    );
    if (status) {
      await ActionsGetxController.to.deleteAllRows();
      await CategoryGetxController.to.deleteAllRows();
    }
  }

  Future<void> deleteAccount({required BuildContext context}) async {
    bool userDeleted = await UserDbController().delete(SharedPrefController().getUser().id);
    print(userDeleted);
    if (userDeleted) {
      await ActionsGetxController.to.deleteAllRows();
      await CategoryGetxController.to.deleteAllRows();
      SharedPrefController().logout();
      showSnackBar(context, message: 'Account Deleted Successfully!');
      Navigator.pushNamedAndRemoveUntil(context, '/login_screen', (route) => false);
    }
  }
}
