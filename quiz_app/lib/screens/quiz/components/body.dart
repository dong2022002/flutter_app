import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';
import 'package:quiz_app/screens/quiz/components/question_card.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:quiz_app/values/app_padding.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionControllers _questionController = Get.put(QuestionControllers());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg_fix.svg", fit: BoxFit.cover),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(
                height: AppPadding.kDefaultPadding,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.kDefaultPadding),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                          text:
                              'Question ${_questionController.questionNumber.value}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColors.kSecondaryColor),
                          children: [
                            TextSpan(
                              text: '/${_questionController.questions.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: AppColors.kSecondaryColor),
                            )
                          ]),
                    ),
                  )),
              const Divider(thickness: 1.5),
              const SizedBox(
                height: AppPadding.kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
