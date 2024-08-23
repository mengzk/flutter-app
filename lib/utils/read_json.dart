import 'dart:convert';
import 'package:flutter/services.dart';

//// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc: 读取json文件
///

Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}

Future<List<dynamic>> loadJsonFromAssets3(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}
