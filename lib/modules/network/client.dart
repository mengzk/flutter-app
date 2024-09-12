import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'interceptor/log_interceptor.dart';
import 'my_transformer.dart';

/// Author: Meng
/// Date: 2024-08-23
/// Modify: 2024-08-23
/// Desc:
///
class Client {
  /// 请求
  static Dio dio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: "", //
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      extra: {'cancelDuplicatedRequest': true}, // 是否取消重复请求
    ));

    // 自定义转换器
    // dio.transformer = MyTransformer();

    // 添加拦截器
    dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (o) => debugPrint(o.toString())));
    // dio.interceptors.add(const Log3Interceptor());
    return dio;
  }

  /// error统一处理
  static Map<String, dynamic> err(DioException e) {
    int code;
    String msg;
    switch (e.type) {
      case DioExceptionType.connectionError:
        code = -1010;
        msg = "网络信号弱,请检查网络设置";
        break;
      case DioExceptionType.connectionTimeout:
        code = -1010;
        msg = "连接超时";
        break;
      case DioExceptionType.receiveTimeout:
        msg = "响应超时";
        code = -1020;
        break;
      case DioExceptionType.sendTimeout:
        msg = "请求超时";
        code = -1030;
        break;
      case DioExceptionType.badResponse:
        msg = "请求结果异常";
        code = -1040;
        break;
      case DioExceptionType.badCertificate:
        msg = "证书有误";
        code = -1050;
        break;
      case DioExceptionType.cancel:
        msg = "请求取消";
        code = -1060;
        break;
      case DioExceptionType.unknown:
        msg = "服务未知错误";
        code = -1070;
        break;
      default:
        code = -1080;
        msg = "未知异常";
        break;
    }

    return {'code': code, 'msg': msg};
  }
}
