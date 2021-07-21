import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_button.dart';
import 'package:budget_planner/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(62),
          bottom: SizeConfig.scaleHeight(44),
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
        ),
        child: Column(
          children: [
            Container(
              height: SizeConfig.scaleHeight(10),
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(108),),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(5)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  value: (currentIndex + 1) / 3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppStyleColors.PRIMARY_COLOR),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  OnBoardingWidget(
                    title: AppLocalizations.of(context)!.on_boarding_title_1,
                    subTitle: AppLocalizations.of(context)!.on_boarding_msg_1,
                    svgIcon: 'on_boarding_image1',
                  ),
                  OnBoardingWidget(
                    title: AppLocalizations.of(context)!.on_boarding_title_2,
                    subTitle: AppLocalizations.of(context)!.on_boarding_msg_2,
                    svgIcon: 'on_boarding_image2',
                  ),
                  OnBoardingWidget(
                    title: AppLocalizations.of(context)!.on_boarding_title_3,
                    subTitle: AppLocalizations.of(context)!.on_boarding_msg_3,
                    svgIcon: 'on_boarding_image3',
                  ),
                ],
              ),
            ),
            AppElevatedButton(
              text: currentIndex == 2 ? AppLocalizations.of(context)!.start_button_label : AppLocalizations.of(context)!.next_button_label,
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              onPressed: goToNextPage,
              fontSize: SizeConfig.scaleTextFont(15),
            ),
            AppTextButton(
              text: AppLocalizations.of(context)!.skip_button_label,
              textColor: AppStyleColors.GRAY_COLOR,
              onPressed: skip,
              fontSize: SizeConfig.scaleTextFont(15),
            )
          ],
        ),
      ),
    );
  }

  void skip() {
    pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void goToNextPage() {
    if (currentIndex == 2) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
