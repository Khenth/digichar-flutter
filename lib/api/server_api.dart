import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import '../config/config.dart';

class ServerApi {
  static Future<dynamic> httpGet(String path) async {
    final url = Uri.parse('${Environments.apiUrl}$path');
    Response res = await get(url);

    final  body = json.decode(res.body);

    if (res.statusCode == 200) {
      return body;
    } else {
      log("Error on get");
      body as Map<String, dynamic>;
      if (body.containsKey('msg')) {
      throw body;
      } else {
        throw {"msg": "Error on Request"};
      }
    }
  }

  static Future<Map<String, dynamic>> httpPost(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('${Environments.apiUrl}$path');
    Response res = await post(url, body: data);
    final Map<String, dynamic> body = json.decode(res.body);
    if (res.statusCode == 200) {
      return body;
    } else {
      log("Error on post");
      if (body.containsKey('msg')) {
         throw body;
      } else {
        throw {"msg": "Error on Create"};
      }
    }
  }

  static Future<Map<String, dynamic>> httpPut(String path, Map<String, dynamic> data) async {
    // final formData = FormData.fromMap(data);

    final url = Uri.parse('${Environments.apiUrl}$path');
    Response res = await put(url, body: data);
    final Map<String, dynamic> body = json.decode(res.body);
    if (res.statusCode == 200) {
      return body;
    } else {
      log("Error on put");
      if (body.containsKey('msg')) {
        throw body;
      } else {
          throw {"msg": "Error on Update"};
      }
    }
  }

  static Future<Map<String, dynamic>> httpDelete(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('${Environments.apiUrl}$path');
    Response res = await delete(url, body: data);
    final Map<String, dynamic> body = json.decode(res.body);
    if (res.statusCode == 200) {
      return body;
    } else {
        log("Error on delete");
      if (body.containsKey('msg')) {
        throw body;
      } else {
        throw {"msg": "Error on delete"};
      }
  }}

  // static Future uploadFile(
  //     String path, Uint8List bytes, String fileName) async {
  //   final formData = FormData.fromMap(
  //       {'file': MultipartFile.fromBytes(bytes, filename: fileName)});
  //   try {
  //     final resp = await dio.put(path, data: formData);
  //     return resp.data;
  //   } on DioException catch (e) {
  //     log(e.toString());
  //     throw ('Error en el PUT file $e');
  //   }
  // }

  // static Future uploadFileData(
  //     String path, Uint8List bytes, String fileName) async {
  //   final formData = FormData.fromMap(
  //       {'file': MultipartFile.fromBytes(bytes, filename: fileName)});
  //   try {
  //     final resp = await dio.post(path, data: formData);
  //     return resp.data;
  //   } on DioException catch (e) {
  //     log(e.toString());
  //     throw ('Error en el POST FILE $e');
  //   }
  // }
}
