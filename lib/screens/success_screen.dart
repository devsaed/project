import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountSuccessScreen extends StatefulWidget {

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<CreateAccountSuccessScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
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
              height: 170,
              width: 170,
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 24),
              margin: EdgeInsets.only(bottom: 29),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppStyleColors.SHADOW_COLOR,
                      offset: Offset(0, 10),
                      blurRadius: 18,
                      spreadRadius: 0)
                ],
              ),
              child: Center(
                child: SvgPicture.asset('assets/svg/like.svg'),
              ),
            ),
            AppTextWidget(
              'Congratulations! ',
              color: AppStyleColors.PRIMARY_TEXT_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(24),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            AppTextWidget(
              'You have registered',
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
