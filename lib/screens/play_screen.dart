import 'dart:async';

import 'package:add_it/blocs/play_screen/play_bloc.dart';
import 'package:add_it/blocs/play_screen/play_event.dart';
import 'package:add_it/blocs/play_screen/play_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayScreen extends StatefulWidget {
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with TickerProviderStateMixin {
  PlayBloc _playBloc;

  AnimationController backgroundProgressAnimationController;

  @override
  void initState() {
    super.initState();
    _playBloc = BlocProvider.of<PlayBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double progressBarWidth = mediaQuery.size.shortestSide;
    double progressBarHeight = mediaQuery.size.longestSide;
    new Timer(new Duration(seconds: 2), () {
      _playBloc.add(StartGame());
    });
    backgroundProgressAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    _playBloc.initProgressBarAnimation(backgroundProgressAnimationController);
    return BlocBuilder<PlayBloc, PlayState>(
      builder: (context, state) {
        return Scaffold(
          body: new Container(
            child: new Stack(
              children: [
                //Background ProgressBar
                new Positioned(
                  top: 0.0,
                  child: new Center(
                    child: new Container(
                      height: progressBarHeight,
                      width: progressBarWidth * state.progressBarAnimationValue,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SumText
                    Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Text(
                          state.sumString,
                          style: new TextStyle(fontSize: 50.0, fontFamily: 'Roboto', color: Colors.lime),
                        )),
                    //Yes-No Container
                    Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new FloatingActionButton(
                              child: new Icon(Icons.check),
                              onPressed: () => _playBloc.add(YesPressed()),
                              backgroundColor: Color.fromRGBO(76, 175, 80, 1.0),
                              heroTag: null,
                            ),
                            new FloatingActionButton(
                              child: new Icon(Icons.clear),
                              onPressed: () => _playBloc.add(NoPressed()),
                              backgroundColor: Color.fromRGBO(255, 87, 34, 1.0),
                              heroTag: null,
                            )
                          ],
                        )),
                    //ScoreText
                    Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Text(
                          state.score.toString(),
                          style: new TextStyle(fontSize: 80.0, fontFamily: 'Roboto', color: Colors.lime),
                        )),
                    //ResetButton
                    Opacity(
                        opacity: state.resetButtonVisible ? 1.0 : 0.0,
                        child: new Container(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: new FlatButton(
                              onPressed: () => state.resetButtonVisible ? _playBloc.add(StartGame()) : null,
                              child: new Text("Reset", style: new TextStyle(fontSize: 25.0, color: Colors.lime))),
                        ))
                  ],
                )
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }

  @override
  void dispose() {
    backgroundProgressAnimationController.dispose();
    super.dispose();
  }
}
