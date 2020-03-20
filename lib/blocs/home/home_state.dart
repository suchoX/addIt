import 'package:add_it/utils/pref_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class HomeState extends Equatable {

  final int highScore;

  HomeState({@required this.highScore});

  @override
  List<Object> get props => [highScore];

  factory HomeState.initial() {
    PreferenceUtils _preferenceUtils = new PreferenceUtils();
    return HomeState(highScore: _preferenceUtils.getHighScore());
  }

  HomeState copyWith({int highScore}) {
    return HomeState(highScore: highScore);
  }

  @override
  String toString() {
    return '''HomeState{
      highScore: $highScore
    }''';
  }
}
