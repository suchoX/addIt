import 'dart:async';
import 'dart:math';

import 'package:add_it/blocs/base_bloc.dart';
import 'package:flutter/animation.dart';
import 'package:rxdart/rxdart.dart';

class PlayBloc extends BaseBloc {
  PlayBloc() {
    initData();
  }

  final String GET_READY = "Get Ready!";

  final _resetButtonOpacity = BehaviorSubject<double>();
  final _score = BehaviorSubject<int>();
  final _sumString = BehaviorSubject<String>();
  final _progressBarAnimationValue = BehaviorSubject<double>();

  Observable<double> get resetButtonOpacity => _resetButtonOpacity.stream;

  Observable<int> get score => _score.stream;

  Observable<String> get sumString => _sumString.stream;

  Observable<double> get progressBarAnimationValue => _progressBarAnimationValue.stream;

  Function(double) get _changeResetButtonOpacity => _resetButtonOpacity.sink.add;

  Function(int) get _changeScore => _score.sink.add;

  Function(String) get _changeSumString => _sumString.sink.add;

  Function(double) get _changeProgressBarAnimationValue => _progressBarAnimationValue.sink.add;

  AnimationController _controller;
  Animation<double> animation;
  bool correctAnswer;
  bool gameStarted = false;

  void initData() {
    _changeResetButtonOpacity(0.0);
    _changeScore(0);
    _changeSumString(GET_READY);
    _changeProgressBarAnimationValue(0.0);
  }

  void initProgressBarAnimation(AnimationController controller) {
    _controller = controller;
    animation = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(controller)
      ..addListener(() {
        _changeProgressBarAnimationValue(animation.value);
      })
      ..addStatusListener((animation) {
        if (animation == AnimationStatus.completed) {
          gameOver("Time Up");
        }
      });
  }

  void startGame() {
    _controller.forward(from: 0.0);
    _changeResetButtonOpacity(0.0);
    _changeScore(0);
    _changeSumString(generateSumString());
    _changeProgressBarAnimationValue(0.0);
    gameStarted = true;
  }

  void nextQuestion() {
    _controller.forward(from: 0.0);
    _changeSumString(generateSumString());
  }

  void gameOver(String message) {
    _controller.stop();
    _changeSumString(message);
    _changeResetButtonOpacity(1.0);
    updateHighScoreIfRequired();
  }

  int generateNumber() {
    Random rand = new Random();
    return rand.nextInt(10);
  }

  String generateSumString() {
    int firstNum = generateNumber();
    int secondNum = generateNumber();

    correctAnswer = new Random().nextBool();
    int sum;
    if (correctAnswer) {
      sum = firstNum + secondNum;
    } else {
      sum = generateWrongSum(firstNum, secondNum);
    }
    return "" + firstNum.toString() + " + " + secondNum.toString() + " = " + sum.toString();
  }

  int generateWrongSum(int firstNumber, int secondNumber) {
    Random rand = new Random();
    bool moreThanActualNumber = rand.nextBool();
    int difference = min(min(firstNumber, secondNumber) + 1, 5);
    if (moreThanActualNumber) {
      return firstNumber + secondNumber + difference;
    } else {
      return firstNumber + secondNumber - difference;
    }
  }

  void updateHighScoreIfRequired() {
    preferenceUtils.setHighScore(_score.value);
  }

  void yesPressed() {
    if (gameStarted) {
      if (answeredCorrectly(true)) {
        _changeScore(_score.value + 1);
        nextQuestion();
      } else {
        gameOver("Game Over");
      }
    }
  }

  void noPressed() {
    if (gameStarted) {
      if (answeredCorrectly(false)) {
        _changeScore(_score.value + 1);
        nextQuestion();
      } else {
        gameOver("Game Over");
      }
    }
  }

  bool answeredCorrectly(bool yesPressed) {
    if (yesPressed) {
      if (correctAnswer) {
        return true;
      } else {
        return false;
      }
    } else {
      if (correctAnswer) {
        return false;
      } else {
        return true;
      }
    }
  }

  Future dispose() async {
    // cleanup
    _resetButtonOpacity.close();
    _score.close();
    _sumString.close();
    _progressBarAnimationValue.close();
    _controller.dispose();
  }
}
