import 'package:add_it/providers/play_provider.dart';
import 'package:add_it/views/playscreen/progressbar.dart';
import 'package:add_it/views/playscreen/reset_button.dart';
import 'package:add_it/views/playscreen/score_text.dart';
import 'package:add_it/views/playscreen/sum_text.dart';
import 'package:add_it/views/playscreen/yes_no_container.dart';
import 'package:flutter_web/material.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayProvider(
      child: PlayScreenView(),
    );
  }
}

class PlayScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Stack(
          children: [
            new Positioned(
              top: 0.0,
              child: new ProgressBar(),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SumText(), YesNoContainer(), ScoreText(), ResetButton()],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
