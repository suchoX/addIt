import 'dart:async';

import 'package:add_it/providers/play_provider.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  build(BuildContext context) {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    final mediaQuery = MediaQuery.of(context);
    double progressBarWidth = mediaQuery.size.shortestSide;
    double progressBarHeight = mediaQuery.size.longestSide;
    final playBloc = PlayProvider.of(context);
    playBloc.initProgressBarAnimation(_controller);
    new Timer(new Duration(seconds: 2), () {
      playBloc.startGame();
    });
    return new StreamBuilder(
        initialData: 0.toDouble(),
        stream: playBloc.progressBarAnimationValue,
        builder: (content, snapshot) {
          double progressBarAnimationValue = snapshot.data;
          return new Center(
            child: new Container(
              height: progressBarHeight,
              width: progressBarWidth * progressBarAnimationValue,
              color: Colors.grey,
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

