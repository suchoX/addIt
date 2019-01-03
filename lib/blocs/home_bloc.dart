import 'package:add_it/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  HomeBloc() {
    getHighScore();
  }

  final _highScore = BehaviorSubject<int>();

  Observable<int> get highScore => _highScore.stream;

  Function(int) get _changeHighScore => _highScore.sink.add;

  void changeHighScore(int highScore) {
    _changeHighScore(highScore);
    preferenceUtils.setHighScore(highScore);
  }

  int getHighScore() {
    int highScore = preferenceUtils.getHighScore();
    _changeHighScore(highScore);
    return highScore;
  }

  int loadState() {
    return getHighScore();
  }

  Future dispose() async {
    _highScore.close();
  }

  void loadInitialState() {}
}
