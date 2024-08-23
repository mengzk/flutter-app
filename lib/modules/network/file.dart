import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/modules/network/client.dart';

/// Author: Meng
/// Date: 2024-08-23
/// Modify: 2024-08-23
/// Desc:
///
class FileTask {
  ///
  static Future upload(path, String name, Map<String, String>? params) async {
    try {
      final formData = FormData.fromMap({
        // 'name': 'dio',
        'param': params,
        'file': await MultipartFile.fromFile(path)
      });
      final headers = {'Content-Type': 'multipart/form-data'};
      final response = await Client.dio().post('/file/uploadFile',
          data: formData, options: Options(headers: headers));
      final result = response.data;
      print(result);
      if (result != null) {
      } else {}
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  ///
  static Future uploads(files, Map<String, String>? params) async {
    try {
      final fileMap = files
          .map((file) => MultipartFile.fromFileSync(file.path,
              filename: file.path.split('/').last))
          .toList();
      final formData = FormData.fromMap({'files': fileMap, 'params': params});
      final response =
          await Client.dio().post('/file/uploadFile', data: formData);
      final result = response.data;

      if (result != null) {
      } else {}
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  ///
  static Future download(String url, String savePath) async {
    try {
      var response = await Client.dio().download(
        url,
        savePath,
        onReceiveProgress: (int count, int total) {
          print("download -----> $count / $total");
        },
      );
      return response;
    } on DioException catch (e) {
      return Client.err(e);
    }
  }

  ///
  static Future insert(
      String url, List<File> files, Map<String, dynamic>? params) async {
    try {
      var fileMap = files
          .map((e) => MultipartFile.fromFileSync(e.path,
              filename: e.path.split('/').last))
          .toList();
      final formData = FormData.fromMap({
        'param': MultipartFile.fromString(
          jsonEncode(params),
          contentType: Headers.jsonMimeType,
        ),
        'files': fileMap
      });
      final headers = {'Content-Type': 'multipart/form-data'};
      final response = await Client.dio()
          .post(url, data: formData, options: Options(headers: headers));
      final result = response.data;
      if (result != null) {
      } else {}
    } on DioException catch (e) {
      return Client.err(e);
    }

    return Future.value();
  }
}
