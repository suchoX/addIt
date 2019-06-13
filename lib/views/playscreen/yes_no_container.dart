import 'package:add_it/providers/play_provider.dart';
import 'package:flutter_web/material.dart';

class YesNoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playBloc = PlayProvider.of(context);
    return new Container(
        constraints: BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.only(top: 20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new FloatingActionButton.extended(
              onPressed: playBloc.yesPressed,
              backgroundColor: Color.fromRGBO(76, 175, 80, 1.0),
              heroTag: null,
              label: Text("Yes"),
            ),
            new FloatingActionButton.extended(
              onPressed: playBloc.noPressed,
              backgroundColor: Color.fromRGBO(255, 87, 34, 1.0),
              heroTag: null,
              label: Text("No"),
            )
          ],
        ));
  }
}
