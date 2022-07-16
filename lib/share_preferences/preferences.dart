import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = "";
  static bool _isDark = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString("name") ?? _name;
  static bool get isDark => _prefs.getBool("isDark") ?? _isDark;
  static int get gender => _prefs.getInt("gender") ?? _gender;

  static set name(String name) {
    _name = name;
    _prefs.setString("name", name);
  }

  static set isDark(bool isDark) {
    _isDark = isDark;
    _prefs.setBool("isDark", isDark);
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt("gender", gender);
  }
}
