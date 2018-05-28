import 'package:flutter/material.dart';
import 'package:add_it/homescreen/home_screen.dart';

void main() => runApp(new MyApp());

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
