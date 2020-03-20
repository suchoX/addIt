import 'dart:async';
import 'dart:math';

import 'package:add_it/blocs/play_screen/play_event.dart';
import 'package:add_it/blocs/play_screen/play_state.dart';
import 'package:add_it/utils/pref_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  PreferenceUtils preferenceUtils = PreferenceUtils();

  @override
  PlayState get initialState => PlayState.initial();

  @override
  Stream<PlayState> mapEventToState(
    PlayEvent event,
  ) async* {
    if (event is YesPressed) {
      yield* _yesPressed();
    }
    if (event is NoPressed) {
      yield* _noPressed();
    }
    if (event is StartGame) {
      yield* _startGame();
    }
    if (event is TimesUp) {
      yield* gameOver("Time Up!");
    }
    if (event is WrongAnswer) {
      yield* gameOver("Game Over!");
    }
    if (event is ProgressBarChanged) {
      yield state.copyWith(progressBarAnimationValue: event.animatedValue);
    }
  }

  bool correctAnswer;
  AnimationController _controller;
  Animation<double> animation;

  void initProgressBarAnimation(AnimationController controller) {
    _controller = controller;
    animation = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller)
      ..addListener(() {
        add(ProgressBarChanged(animatedValue: animation.value));
      })
      ..addStatusListener((animation) {
        if (animation == AnimationStatus.completed) {
          add(TimesUp());
        }
      });
  }

  Stream<PlayState> _startGame() async* {
    yield state.copyWith(
        gameStarted: true,
        score: 0,
        sumString: generateSumString(),
        progressBarAnimationValue: 0.0,
        resetButtonVisible: false);
    _controller.forward(from: 0.0);
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

  int generateNumber() {
    Random rand = new Random();
    return rand.nextInt(10);
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

  Stream<PlayState> _yesPressed() async* {
    if (state.gameStarted) {
      if (_answeredCorrectly(true)) {
        yield state.copyWith(sumString: generateSumString(), score: state.score + 1);
        _controller.forward(from: 0.0);
      } else {
        add(WrongAnswer());
      }
    }
  }

  Stream<PlayState> _noPressed() async* {
    if (state.gameStarted) {
      if (_answeredCorrectly(false)) {
        yield state.copyWith(sumString: generateSumString(), score: state.score + 1);
        _controller.forward(from: 0.0);
      } else {
        add(WrongAnswer());
      }
    }
  }

  bool _answeredCorrectly(bool yesPressed) {
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

  Stream<PlayState> gameOver(String message) async* {
    _controller.stop();
    yield state.copyWith(sumString: message, resetButtonVisible: true);
    preferenceUtils.setHighScore(state.score);
  }
}
