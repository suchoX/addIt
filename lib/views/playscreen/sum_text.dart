import 'package:add_it/providers/play_provider.dart';
import 'package:flutter/material.dart';

class SumText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playBloc = PlayProvider.of(context);
    return new StreamBuilder(
        initialData: playBloc.sumString,
        stream: playBloc.sumString,
        builder: (content, snapshot) {
          String sumString = snapshot.data;
          return new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Text(
                sumString,
                style: new TextStyle(fontSize: 50.0, fontFamily: 'Roboto', color: Colors.lime),
              ));
        });
  }
}
