import 'dart:async';
import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is HighScoreUpdated) {
      yield state.copyWith(highScore: event.highScore);
    }
    if(event is HighScoreReset) {
      yield state.copyWith(highScore: 0);
    }
  }
}
