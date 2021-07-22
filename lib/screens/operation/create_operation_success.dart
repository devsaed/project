import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CreateOperationSuccess extends StatefulWidget {
  @override
  _CreateOperationSuccessState createState() => _CreateOperationSuccessState();
}

class _CreateOperationSuccessState extends State<CreateOperationSuccess> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: SizeConfig.scaleHeight(170),
              width: SizeConfig.scaleWidth(170),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(42),
                  vertical: SizeConfig.scaleHeight(24)),
              margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(30)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppStyleColors.SHADOW_COLOR,
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0)
                  ]),
              child: Center(
                child: SvgPicture.asset('assets/svg/logo.svg'),
              ),
            ),
            AppTextWidget(
              AppLocalizations.of(context)!.well_done,
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(24),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(18),
            ),
            AppTextWidget(
              AppLocalizations.of(context)!.success_add_operation,
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.w300,
              fontSize: SizeConfig.scaleTextFont(18),
            ),
          ],
        ),
      ),
    );
  }
}
