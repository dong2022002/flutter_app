import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionControllers _controller = Get.put(QuestionControllers());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg_fix.svg", fit: BoxFit.cover),
          Column(
            children: [
              const Spacer(flex: 3),
              Text("Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColors.kSecondaryColor)),
              const Spacer(),
              Text(
                  "${_controller.numOfCrorrectAns * 10}/${_controller.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: AppColors.kSecondaryColor)),
              const Spacer(),
              InkWell(
                onTap: (() {
                  _controller.onClose();
                  _controller.onInit();
                  _controller.updateQnNum(0);
                  Get.to(const QuizScreen());
                }),
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 32),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24)),
                    child: Text('Play again!',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.kBlackColor))),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
