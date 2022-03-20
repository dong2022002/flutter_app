// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controllers.dart';
import 'package:quiz_app/screens/quiz/Components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionControllers _controller = Get.put(QuestionControllers());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: () {
                _controller.nextQuestion();
              },
              child: const Text('skip'))
        ],
      ),
      body: const Body(),
    );
  }
}
