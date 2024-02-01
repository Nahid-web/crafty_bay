import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../models/response_data.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url, {String? token}) async {

    log(url);
    log(token.toString());

    final http.Response response = await http.get(Uri.parse(url), headers: {
      'token': token.toString(),
      'Content-type': 'application/json',
    });

    log(response.headers.toString());
    log(response.statusCode.toString());
    log(response.body);

    if (response.statusCode == 200) {
      final decodeResponseBody = jsonDecode(response.body);
      if (decodeResponseBody['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodeResponseBody,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseBody: decodeResponseBody,
          errorMessage: decodeResponseBody['data'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseBody: '',
      );
    }
  }

  Future<ResponseData> postRequest(String url, {String? token, Map<String, dynamic>? body}) async {
    log(url);
    log(token.toString());
    log(body.toString());

    final http.Response response = await http.post(Uri.parse(url), headers: {
      'token': token.toString(),
      'Content-type': 'application/json',
    },
      body: jsonEncode(body),
    );

    log(response.headers.toString());
    log(response.statusCode.toString());
    log(response.body);

    if (response.statusCode == 200) {
      final decodeResponseBody = jsonDecode(response.body);
      if (decodeResponseBody['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: decodeResponseBody,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseBody: decodeResponseBody,
          errorMessage: decodeResponseBody['data'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseBody: '',
      );
    }
  }

}
