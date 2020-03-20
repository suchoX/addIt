import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HighScoreUpdated extends HomeEvent {
  final int highScore;

  const HighScoreUpdated({@required this.highScore});

  @override
  List<Object> get props => [highScore];

  @override
  String toString() => 'HighScoreUpdated { highScore: $highScore }';
}

class HighScoreReset extends HomeEvent {
  @override
  String toString() => 'HighScoreReset';
}
