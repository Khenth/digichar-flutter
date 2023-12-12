import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences prefs;
  static String _token = '';

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String get getToken {
    return Preferences.prefs.getString('refreshToken') ?? _token;
  }

}
