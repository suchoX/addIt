import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PlayState extends Equatable {
  static const String GET_READY = "Get Ready!";

  final bool gameStarted;
  final int score;
  final String sumString;
  final double progressBarAnimationValue;
  final bool resetButtonVisible;

  const PlayState(
      {@required this.gameStarted,
      @required this.score,
      @required this.sumString,
      @required this.progressBarAnimationValue,
      @required this.resetButtonVisible});

  factory PlayState.initial() {
    return PlayState(
        gameStarted: false, score: 0, sumString: GET_READY, progressBarAnimationValue: 0.0, resetButtonVisible: false);
  }

  PlayState copyWith({
     bool gameStarted,
     int score,
     String sumString,
     double progressBarAnimationValue,
     bool resetButtonVisible,
  }) {
    return PlayState(
      gameStarted: gameStarted ?? this.gameStarted,
      score: score ?? this.score,
      sumString: sumString ?? this.sumString,
      progressBarAnimationValue: progressBarAnimationValue ?? this.progressBarAnimationValue,
      resetButtonVisible: resetButtonVisible ?? this.resetButtonVisible,
    );
  }
  @override
  List<Object> get props => [score, sumString, progressBarAnimationValue, resetButtonVisible];

  @override
  String toString() {
    return '''PlayState{
      score: $score,
      sumString: $sumString,
      progressBarAnimationValue: $progressBarAnimationValue,
      resetButtonOpacity: $resetButtonVisible
    }''';
  }
}
