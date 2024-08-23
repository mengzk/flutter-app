import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  /// 设置token
  static Future<void> setToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app-token', value);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('app-token');
    print('token ---------> $token');
    getUser();
    return token;
  }

  /// 设置用户信息
  static Future<void> setUser(String value) async {
    _saveConsts(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app-user', value);
  }

  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('app-user');
    print('user ---------> $user');
    _saveConsts(user);
    return user;
  }

  /// 设置手机号
  static Future<void> setPhone(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app-phone', value);
  }

  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('app-phone');
  }

  static void _saveConsts(String? info) {
    if (info != null) {
      var user = jsonDecode(info);
    }
  }

  /// 清除账号数据
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('app-token');
    prefs.remove('app-user');
    prefs.remove('app-phone');
  }
}
