import 'package:add_it/providers/play_provider.dart';
import 'package:flutter/material.dart';

class YesNoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playBloc = PlayProvider.of(context);
    return new Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new FloatingActionButton(
              child: new Icon(Icons.check),
              onPressed: playBloc.yesPressed,
              backgroundColor: Color.fromRGBO(76, 175, 80, 1.0),
              heroTag: null,
            ),
            new FloatingActionButton(
              child: new Icon(Icons.clear),
              onPressed: playBloc.noPressed,
              backgroundColor: Color.fromRGBO(255, 87, 34, 1.0),
              heroTag: null,
            )
          ],
        ));
  }
}
