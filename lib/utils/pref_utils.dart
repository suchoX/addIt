import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static const HIGH_SCORE_PREFS = "High_score";
  static SharedPreferences preferences;

  void setHighScore(int score) {
    int highScore = (preferences.getInt(HIGH_SCORE_PREFS) ?? 0);
    if (score > highScore) {
      preferences.setInt(HIGH_SCORE_PREFS, score);
    }
  }

  int getHighScore() {
    return (preferences.getInt(HIGH_SCORE_PREFS) ?? 0);
  }
}