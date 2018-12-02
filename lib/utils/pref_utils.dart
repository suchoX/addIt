import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils{
  static const HIGH_SCORE_PREFS = "High_score";

  Future setHighScore(int score) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int highScore = (preferences.getInt(HIGH_SCORE_PREFS) ?? 0);
    if(score > highScore) {
      await preferences.setInt(HIGH_SCORE_PREFS, score);
    }
  }

  Future getHighScore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return (preferences.getInt(HIGH_SCORE_PREFS) ?? 0);
  }
}