import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

/// 拼接参数
class ParamInterceptor extends Interceptor {
  String token = '';

  ParamInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
    // print('---> request:${options.method}, url:${options.path}');
    if (token.isNotEmpty) {
      options.headers.assign('token', token);
      options.headers.assign('accessToken', token);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
    // print('---> response:${response.statusCode}, url:${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
    // print('---> error:${err.response?.statusCode} => url:${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
