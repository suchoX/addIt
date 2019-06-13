import 'package:add_it/blocs/play_bloc.dart';
import 'package:flutter_web/material.dart';

class PlayProvider extends InheritedWidget {
  PlayProvider({Key key, Widget child}) : super(key: key, child: child);
  final PlayBloc playBloc = PlayBloc();

  @override
  bool updateShouldNotify(PlayProvider oldWidget) =>
      (oldWidget.playBloc != playBloc);

  static PlayBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(PlayProvider) as PlayProvider)
        .playBloc;
  }
}
