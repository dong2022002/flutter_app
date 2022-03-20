// ignore_for_file: unused_field, unnecessary_this, unnecessary_overrides, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionControllers extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? _animationController;
  Animation? _animation;

  Animation? get animation => this._animation;
  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map((e) => Question(
          id: e['id'],
          question: e['question'],
          answer: e['answer_index'],
          options: e['options']))
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _crorrectAns = 0;
  int get crorrectAns => this._crorrectAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  late final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCrorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });
    _animationController?.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _isAnswered = false;
    _numOfCorrectAns = 0;
    _animationController!.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _selectedAns = selectedIndex;

    _crorrectAns = question.answer;
    if (_selectedAns == _crorrectAns) {
      _numOfCorrectAns++;
    }
    _animationController!.stop();
    update();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        nextQuestion();
      },
    );
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController?.reset();
      _animationController?.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(const ScoreScreen());
    }
  }

  void updateQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
