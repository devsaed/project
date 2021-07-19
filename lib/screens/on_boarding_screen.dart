import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_button.dart';
import 'package:budget_planner/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

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
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaleWidth(108),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(5)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  value: (currentIndex + 1) / 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppStyleColors.PRIMARY_COLOR),
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
                    title: 'Take hold of your finances',
                    subTitle: 'Managing your finances can be effortless ',
                    svgIcon: 'on_boarding_image1',
                  ),
                  OnBoardingWidget(
                    title: 'See where your money goes',
                    subTitle:
                        'This app helps your to track your income and expenditure via automatic bank synchronization or manually ',
                    svgIcon: 'on_boarding_image2',
                  ),
                  OnBoardingWidget(
                    title: 'Reach your goals with ease',
                    subTitle:
                        'Managing your finances can be effortless Budget App makes it a breeze',
                    svgIcon: 'on_boarding_image3',
                  ),
                ],
              ),
            ),
            AppElevatedButton(
              text: currentIndex == 2 ? 'Let\'s start' : 'Next',
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              onPressed: goToNextPage,
            ),
            AppTextButton(
              text: 'skip',
              textColor: AppStyleColors.GRAY_COLOR,
              onPressed: skip,
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
