import 'package:add_it/screens/home_screen.dart';
import 'package:flutter_web/material.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Add-IT',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomeScreen(),
    );
  }
}
