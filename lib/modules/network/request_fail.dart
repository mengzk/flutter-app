import 'package:dio/dio.dart';

/// 自定义异常
class RequestFail {
  final String message;
  final int code;

  RequestFail(
    this.code,
    this.message,
  );

  @override
  String toString() {
    return "$code, $message";
  }

  String getMessage() {
    return message;
  }

  int getCode() {
    return code;
  }

  /// 创建异常解析
  static create(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return RequestFail(-1010, "请求取消");
      case DioExceptionType.connectionTimeout:
        return RequestFail(-1020, "连接超时");
      case DioExceptionType.sendTimeout:
        return RequestFail(-1030, "请求超时");
      case DioExceptionType.receiveTimeout:
        return RequestFail(-1040, "响应超时");
      case DioExceptionType.badResponse:
        return error.response != null
            ? responseFail(error.response!)
            : RequestFail(-1050, "网络异常");
      default:
        return RequestFail(-1070, error.message ?? "未知错误");
    }
  }

  /// 响应失败解析
  static RequestFail responseFail(Response response) {
    String msg = response.statusMessage ?? "未知错误";
    int errCode = response.statusCode ?? -1050;
    switch (errCode) {
      case 400:
        return RequestFail(errCode, "请求语法错误");
      case 401:
        return RequestFail(errCode, "没有权限");
      case 403:
        return RequestFail(errCode, "服务器拒绝执行");
      case 404:
        return RequestFail(errCode, "无法连接服务器");
      case 405:
        return RequestFail(errCode, "请求方法被禁止");
      case 500:
        return RequestFail(errCode, "服务器内部错误");
      case 502:
        return RequestFail(errCode, "无效的请求");
      case 503:
        return RequestFail(errCode, "服务器挂了");
      case 505:
        return RequestFail(errCode, "不支持HTTP协议请求");
      default:
        return RequestFail(errCode, msg);
    }
  }
}
