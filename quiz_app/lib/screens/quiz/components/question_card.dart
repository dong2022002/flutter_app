import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:quiz_app/values/app_padding.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionControllers _controller = Get.put(QuestionControllers());
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: AppPadding.kDefaultPadding),
      padding: const EdgeInsets.all(AppPadding.kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.kBlackColor),
          ),
          const SizedBox(height: AppPadding.kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () {
                _controller.checkAns(question, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
