import 'package:flutter/material.dart';
import 'package:add_it/custom_widget/progressbar.dart';
import 'playscreen_presenter.dart';
import 'dart:async';

class PlayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with TickerProviderStateMixin implements PlayScreenView {
  PlayScreenPresenter presenter;

  AnimationController _controller;
  Animation<double> animation;
  String sumString = "Get Ready!";
  int score = 0;
  double progressBarWidth = 0.0;
  double resetButtonOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    presenter = new PlayScreenPresenter(this);
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );

    animation = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller)
      ..addStatusListener((animation) {
        if (animation == AnimationStatus.completed) {
          gameOver("Time Up");
        }
      });

    new Timer(new Duration(seconds: 3), () {
      startGame();
    });
  }

  void generateSumString() {
    setState(() {
      sumString = presenter.generateSumString();
    });
  }

  void startGame() {
    _controller.forward(from: 0.0);
    generateSumString();
    presenter.gameStarted = true;
    setState(() {
      score = 0;
      resetButtonOpacity = 0.0;
    });
  }

  void nextQuestion() {
    _controller.forward(from: 0.0);
    generateSumString();
  }

  void yesPressed() {
    if (presenter.gameStarted) {
      setState(() {
        if (presenter.answeredCorrectly(true)) {
          score = score + 1;
          nextQuestion();
        } else {
          gameOver("Game Over");
        }
      });
    }
  }

  void noPressed() {
    if (presenter.gameStarted) {
      setState(() {
        if (presenter.answeredCorrectly(false)) {
          gameOver("Game Over");
        } else {
          score = score + 1;
          nextQuestion();
        }
      });
    }
  }

  void gameOver(String message) {
    presenter.updateHighScoreIfRequired(score);
    setState(() {
      _controller.stop();
      sumString = message;
      resetButtonOpacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    double progressBarWidth = mediaquery.size.shortestSide;
    double progressBarHeight = mediaquery.size.longestSide;
    return new Scaffold(
      body: new Container(
        child: new Stack(
          children: [
            new Positioned(
              top: 0.0,
              child: new ProgressBar(animation: animation, progressBarWidth: progressBarWidth, progressBarHeight: progressBarHeight),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: new Text(
                      sumString,
                      style: new TextStyle(fontSize: 50.0, fontFamily: 'Roboto', color: Colors.lime),
                    )),
                new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new FloatingActionButton(
                          child: new Icon(Icons.check),
                          onPressed: yesPressed,
                          backgroundColor: Color.fromRGBO(76, 175, 80, 1.0),
                          heroTag: null,
                        ),
                        new FloatingActionButton(
                          child: new Icon(Icons.clear),
                          onPressed: noPressed,
                          backgroundColor: Color.fromRGBO(255, 87, 34, 1.0),
                          heroTag: null,
                        )
                      ],
                    )),
                new Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: new Text(
                      score.toString(),
                      style: new TextStyle(fontSize: 80.0, fontFamily: 'Roboto', color: Colors.lime),
                    )),
                new Opacity(
                    opacity: resetButtonOpacity,
                    child: new Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new FlatButton(onPressed: startGame, child: new Text("Reset", style: new TextStyle(fontSize: 25.0, color: Colors.lime))),
                    ))
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
