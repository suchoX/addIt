import 'package:add_it/blocs/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeProvider extends InheritedWidget {
  HomeProvider({Key key, Widget child}) : super(key: key, child: child);
  final HomeBloc homeBloc = HomeBloc();

  @override
  bool updateShouldNotify(HomeProvider oldWidget) =>
      (oldWidget.homeBloc != homeBloc);

  static HomeBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(HomeProvider) as HomeProvider)
        .homeBloc;
  }
}
