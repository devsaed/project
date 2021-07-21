import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/app_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<bool> deleteDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    bool status = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(SizeConfig.scaleHeight(25)),
              side: BorderSide(
                color: Colors.red.shade900,
                width: 2
              )
            ),
            title: AppTextWidget(
              title,
              fontSize: SizeConfig.scaleTextFont(15),
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
            ),
            content: AppTextWidget(
              content,
              fontSize: SizeConfig.scaleTextFont(12),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: AppTextWidget(
                  'NO',
                  fontSize: SizeConfig.scaleTextFont(12),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: AppTextWidget(
                  'YES',
                  fontSize: SizeConfig.scaleTextFont(12),
                  color: Colors.red.shade900,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],

          );
        });
    return status;
  }
}
