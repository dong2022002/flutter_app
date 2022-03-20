import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:quiz_app/values/app_padding.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3F4768), width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: GetBuilder<QuestionControllers>(
          init: QuestionControllers(),
          builder: (controller) {
            //print(controller.animation!.value);

            return Stack(
              children: [
                LayoutBuilder(
                    builder: ((context, constraints) => Container(
                          width: constraints.maxWidth *
                              controller.animation!.value,
                          decoration: const BoxDecoration(
                              gradient: AppColors.kPrimaryGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ))),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${(controller.animation!.value * 60).round()} sec'),
                      WebsafeSvg.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
