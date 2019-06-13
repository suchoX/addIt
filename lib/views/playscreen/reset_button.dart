import 'package:add_it/providers/play_provider.dart';
import 'package:flutter_web/material.dart';

class ResetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playBloc = PlayProvider.of(context);
    return new StreamBuilder(
        initialData: 0.toDouble(),
        stream: playBloc.resetButtonOpacity,
        builder: (content, snapshot) {
          double resetButtonOpacity = snapshot.data;
          return new Opacity(
              opacity: resetButtonOpacity,
              child: new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new FlatButton(
                    onPressed: resetButtonOpacity == 1.0 ? playBloc.startGame : null,
                    child: new Text("Reset", style: new TextStyle(fontSize: 25.0, color: Colors.lime))),
              ));
        });
  }
}
