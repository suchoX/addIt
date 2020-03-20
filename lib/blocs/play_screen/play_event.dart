import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PlayEvent extends Equatable {
  const PlayEvent();
}

class YesPressed extends PlayEvent{
  @override
  List<Object> get props => [];
}

class NoPressed extends PlayEvent{
  @override
  List<Object> get props => [];
}

class StartGame extends PlayEvent{
  @override
  List<Object> get props => [];
}

class TimesUp extends PlayEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WrongAnswer extends PlayEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProgressBarChanged extends PlayEvent{
  final double animatedValue;

  const ProgressBarChanged({@required this.animatedValue});

  @override
  List<Object> get props => [animatedValue];

}