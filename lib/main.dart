import 'package:add_it/screens/home_screen.dart';
import 'package:add_it/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  PreferenceUtils.preferences = await SharedPreferences.getInstance();
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
