import 'package:flutter/material.dart';

class ProgressBar extends AnimatedWidget {
  ProgressBar({Key key, this.animation, this.progressBarWidth, this.progressBarHeight}) : super(key: key, listenable: animation);
  Animation<double> animation;
  double progressBarWidth;
  double progressBarHeight;

  @override
  build(BuildContext context) {
    return new Center(
      child: new Container(
        height: progressBarHeight,
        width: progressBarWidth * animation.value,
        color: Colors.grey,
      ),
    );
  }
}