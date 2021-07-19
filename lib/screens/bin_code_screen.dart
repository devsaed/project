import 'package:budget_planner/utils/app_style_colors.dart';
import 'package:budget_planner/utils/helpers.dart';
import 'package:budget_planner/widgets/app_elevated_button.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:budget_planner/widgets/bin_code_input_widget.dart';
import 'package:budget_planner/widgets/bin_code_widget.dart';
import 'package:flutter/material.dart';

class BinCodeScreen extends StatefulWidget {
  @override
  _BinCodeScreenState createState() => _BinCodeScreenState();
}

class _BinCodeScreenState extends State<BinCodeScreen> with Helpers{
  String? number1;

  String? number2;

  String? number3;

  String? number4;

  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 120)),
          AppTextWidget(
            'Enter Passcode',
            color: AppStyleColors.PRIMARY_COLOR,
            fontFamily: 'montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          AppTextWidget('New PIN',
              color: AppStyleColors.GRAY_COLOR,
              fontFamily: 'montserrat',
              fontSize: 15),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BinCodeInputWidget(
                number: number1 ?? '',
                isFilled: number1 == null ? false : true,
              ),
              BinCodeInputWidget(
                number: number2 ?? '',
                isFilled: number2 == null ? false : true,
              ),
              BinCodeInputWidget(
                number: number3 ?? '',
                isFilled: number3 == null ? false : true,
              ),
              BinCodeInputWidget(
                number: number4 ?? '',
                isFilled: number4 == null ? false : true,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BinCodeWidget(
                      number: '1',
                      onTap: () {
                        setState(() {
                          createCode('1');
                        });
                      },
                    ),
                    BinCodeWidget(
                      number: '2',
                      onTap: () {
                        setState(() {
                          createCode('2');
                        });
                      },
                    ),
                    BinCodeWidget(
                      number: '3',
                      onTap: () {
                        setState(() {
                          createCode('3');
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BinCodeWidget(
                        number: '4',
                        onTap: () {
                          setState(() {
                            createCode('4');
                          });
                        }),
                    BinCodeWidget(
                        number: '5',
                        onTap: () {
                          setState(() {
                            createCode('5');
                          });
                        }),
                    BinCodeWidget(
                        number: '6',
                        onTap: () {
                          setState(() {
                            createCode('6');
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BinCodeWidget(
                        number: '7',
                        onTap: () {
                          setState(() {
                            createCode('7');
                          });
                        }),
                    BinCodeWidget(
                        number: '8',
                        onTap: () {
                          setState(() {
                            createCode('8');
                          });
                        }),
                    BinCodeWidget(
                      number: '9',
                      onTap: () {
                        setState(() {
                          createCode('9');
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 98,
                    ),
                    BinCodeWidget(
                      number: '0',
                      onTap: () {
                        setState(() {
                          createCode('0');
                        });
                      },
                    ),
                    BinCodeWidget(
                      onTap: () {
                        setState(() {
                          removeCode();
                        });
                      },
                      bgColor: AppStyleColors.PRIMARY_COLOR,
                      iconData: Icons.backspace_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
            child: AppElevatedButton(
              text: 'Apply',
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              onPressed: () {
                if(getCode(context)){
                  // Navigator.pushNamed(context, '/main_screen');
                  Navigator.pop(context,code);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void createCode(String num) {
    if (number1 == null) {
      number1 = num;
    } else if (number2 == null) {
      number2 = num;
    } else if (number3 == null) {
      number3 = num;
    } else if (number4 == null) {
      number4 = num;
    }
  }

  removeCode() {
    if (number4 != null) {
      number4 = null;
    } else if (number3 != null) {
      number3 = null;
    } else if (number2 != null) {
      number2 = null;
    } else if (number1 != null) {
      number1 = null;
    }
  }

   bool getCode(BuildContext context) {
    if (number1 != null &&
        number2 != null &&
        number3 != null &&
        number4 != null) {
      code = number1! + number2! + number3! + number4!;
      return true;
    } else {
      showSnackBar(context, message: 'complete bin code please!', error:  true);
      return false;
    }
  }
}
