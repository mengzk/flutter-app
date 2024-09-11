import 'package:dio/dio.dart';
import 'package:flutter_app/modules/network/client.dart';

/// Author: Meng
/// Date: 2024-08-16
/// Modify: 2024-08-16
/// Desc: 请求
///
class Request {
  /// 请求
  static Future request(String url,
      {String method = 'POST',
      Map<String, dynamic>? params,
      Map<String, dynamic>? header,
      bool loading = true}) async {
    final headers = {'Content-Type': 'application/json'};
    final data = {};

    final options = Options(method: method, headers: headers);
    try {
      final response =
          await Client.dio().request(url, data: data, options: options);
      final result = response.data;
      print(result);
      if (result != null) {
        var code = result['code'];
        if (code == '401') {
        } else if (code != '1') {
          // 提示报错信息
        }
      } else {
        // 提示报错信息
      }
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  /// get请求
  static Future get(String url, Map<String, dynamic>? params) async {
    try {
      Response response = await Client.dio().get(url, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  /// post请求
  static Future post(String url, Map<String, dynamic>? params) async {
    try {
      Response response = await Client.dio().post(url, data: params);
      return response.data;
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  /// post表单
  static Future postForm(String url, Map<String, dynamic>? params) async {
    try {
      Response response = await Client.dio().post(url, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  /// put请求
  static Future put() async {
    return Future.value();
  }

  /// delete请求
  static Future delete() async {
    return Future.value();
  }

  /// patch请求
  static Future patch() async {
    return Future.value();
  }
}
