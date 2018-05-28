import 'package:add_it/base/base_presenter.dart';
import 'package:add_it/base/base_view.dart';
import 'dart:math';

class PlayScreenPresenter extends BasePresenter<PlayScreenView> {
  PlayScreenPresenter(PlayScreenView view) : super(view);

  bool correctAnswer;
  bool gameStarted = false;

  void updateHighScoreIfRequired(int score) {
    preferenceUtils.setHighScore(score);
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
}

abstract class PlayScreenView extends BaseView {}
