import 'package:shared_preferences/shared_preferences.dart';

class Store {

  static Future<void> setStringData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('counter', value);
  }
  static void getStringData(String key, String value) {

  }
  static void setIntData(String key, int value) {

  }
  static void getIntData(String key) {

  }

  static void setBoolData(String key, bool value) {

  }
  static void getBoolData(String key) {

  }
}