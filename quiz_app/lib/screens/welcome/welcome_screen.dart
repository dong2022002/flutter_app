import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/values/app_colors.dart';
import 'package:quiz_app/values/app_padding.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg_fix.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                  "Let's Play Quiz",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text('Enter your information below'),
                const Spacer(),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1c2341),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const Spacer(),
                InkWell(
                  onTap: (() => Get.to(const QuizScreen())),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.all(AppPadding.kDefaultPadding * 0.75),
                    decoration: const BoxDecoration(
                      gradient: AppColors.kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Let's Start Quiz",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
