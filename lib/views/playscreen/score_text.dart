import 'package:add_it/providers/play_provider.dart';
import 'package:flutter/material.dart';

class ScoreText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playBloc = PlayProvider.of(context);
    return new StreamBuilder(
        initialData: 0,
        stream: playBloc.score,
        builder: (content, snapshot) {
          int score = snapshot.data;
          return new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Text(
                score.toString(),
                style: new TextStyle(fontSize: 80.0, fontFamily: 'Roboto', color: Colors.lime),
              ));
        });
  }
}
