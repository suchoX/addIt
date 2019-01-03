
import 'package:add_it/providers/home_provider.dart';
import 'package:flutter/material.dart';

class HighScoreText extends StatelessWidget {
  static const SCORE_STRING_CONST = "Your High Score : ";
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    return new StreamBuilder(
      initialData: homeBloc.loadState(),
      stream: homeBloc.highScore,
      builder: (content, snapshot) {
        int highScore = snapshot.data;
        return new Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: new Text(SCORE_STRING_CONST + "$highScore",
              style: new TextStyle(
                  fontSize: 15.0, color: Colors.white)),
        );
      },
    );
  }
}
