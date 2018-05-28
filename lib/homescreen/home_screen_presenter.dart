import 'package:add_it/base/base_view.dart';
import 'package:add_it/base/base_presenter.dart';

class HomeScreenPresenter extends BasePresenter<HomeScreenView> {
  HomeScreenPresenter(HomeScreenView view) : super(view);

  void fetchHighScore() {
    preferenceUtils.getHighScore().then((highScore) {
      view.highScoreFetched(highScore);
    });
  }
}

abstract class HomeScreenView extends BaseView {
  void highScoreFetched(int highScore);
}
