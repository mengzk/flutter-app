import 'dart:convert';

/// Author: Meng
/// Date: 2024-08-23
/// Modify: 2024-08-23
/// Desc: 请求结果
///
class Result<T> {
  int code;
  String msg;
  T? data;

  Result({this.code = 1, this.msg = 'ok', this.data});

  @override
  String toString() {
    if (data is Map) {
      return jsonEncode(data);
    }
    return data.toString();
  }
}
