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
        code = -100;
        msg = "网络信号弱,请检查网络设置";
        break;
      case DioExceptionType.connectionTimeout:
        code = -101;
        msg = "连接超时";
        break;
      case DioExceptionType.receiveTimeout:
        msg = "响应超时";
        code = -102;
        break;
      case DioExceptionType.sendTimeout:
        msg = "请求超时";
        code = -103;
        break;
      case DioExceptionType.badResponse:
        msg = "请求结果异常";
        code = -104;
        break;
      case DioExceptionType.badCertificate:
        msg = "证书有误";
        code = -105;
        break;
      case DioExceptionType.cancel:
        msg = "请求取消";
        code = -106;
        break;
      case DioExceptionType.unknown:
        msg = "服务未知错误";
        code = -107;
        break;
      default:
        code = -108;
        msg = "未知异常";
        break;
    }

    return {'code': code, 'msg': msg};
  }
}
