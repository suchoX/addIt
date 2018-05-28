import 'package:flutter/material.dart';
import 'package:add_it/playscreen/playscreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Add-IT',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Addit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void howToPlay() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('How to Play'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("You just have to say if the single digit addition is correct or wrong. Simple"),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            color: Color.fromRGBO(44, 62, 80, 1.0),
            child: new SizedBox.expand(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: new Text("Add-IT", style: new TextStyle(fontSize: 100.0, color: Colors.white))),
                  new RaisedButton(
                    child: const Text('Start', style: const TextStyle(fontSize: 30.0)),
                    color: Color.fromRGBO(46, 204, 113, 1.0),
                    textColor: Color.fromRGBO(255, 255, 255, 1.0),
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new PlayScreen()),
                      );
                    },
                    padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: new FlatButton(onPressed: howToPlay, child: new Text("How to Play", style: new TextStyle(fontSize: 15.0, color: Colors.white))),
                  ),

                ],
              ),
            )));
  }
}
