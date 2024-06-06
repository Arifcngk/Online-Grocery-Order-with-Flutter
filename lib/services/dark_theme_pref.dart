import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePref {
  static const String darkTheme = 'THEMESTATUS';
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkTheme, value);
  }


  Future<bool> getDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkTheme) ?? false;
  }
}
