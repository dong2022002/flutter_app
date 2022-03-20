import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:quiz_app/values/app_padding.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionControllers>(
        init: QuestionControllers(),
        builder: (gnController) {
          Color getTheRightColor() {
            if (gnController.isAnswered) {
              if (index == gnController.crorrectAns) {
                return AppColors.kGreenColor;
              } else if (index == gnController.selectedAns &&
                  gnController.selectedAns != gnController.crorrectAns) {
                return AppColors.kRedColor;
              }
            }
            return AppColors.kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == AppColors.kRedColor
                ? Icons.close
                : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: AppPadding.kDefaultPadding),
              padding: const EdgeInsets.all(AppPadding.kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == AppColors.kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      border: Border.all(
                        color: getTheRightColor(),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: getTheRightColor() == AppColors.kGrayColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
