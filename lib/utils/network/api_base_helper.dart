import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tech_connect/utils/app/app_constant.dart';
import 'app_exceptions.dart';

class ApiBaseHelper {
  static final client = http.Client();

  static Future<dynamic> httpGetRequest(String endPoint,
      {String? token}) async {
    http.Response response;
    try {
      response = await client
          .get(Uri.parse('${AppConstants.apiBaseURL}$endPoint'), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    } on SocketException {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  static Future<dynamic> httpPostRequest(String endPoint,
      {Object? body,
      String? token,
      String base = AppConstants.apiBaseURL}) async {
    http.Response response;
    try {
      response = await client
          .post(Uri.parse('$base$endPoint'), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      });
    } on SocketException catch (_) {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException catch (_) {
      throw FetchDataException(AppConstants.badResponseFormat);
    }
    return _returnResponse(response);
  }

  static Future<dynamic> httpPostRequestUrlEnc(String endPoint,
      {Object? body,
      String? token,
      String base = AppConstants.apiBaseURL}) async {
    print(jsonEncode(body));
    http.Response response;
    try {
      response = await client.post(
        Uri.parse('$base$endPoint'),
        body: body,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
      );
    } on SocketException catch (_) {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException catch (_) {
      throw FetchDataException(AppConstants.badResponseFormat);
    }
    return _returnResponse(response);
  }

  static Future<dynamic> httpPutRequest(String endPoint,
      {Object? body, String? token}) async {
    http.Response response;
    try {
      response = await client.put(
          Uri.parse('${AppConstants.apiBaseURL}$endPoint'),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
    } on SocketException catch (_) {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstants.badResponseFormat);
    }
    return _returnResponse(response);
  }

  static Future<dynamic> httpPatchRequest(String endPoint, Object body) async {
    http.Response response;
    try {
      response = await client.patch(
          Uri.parse('${AppConstants.apiBaseURL}$endPoint'),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
    } on SocketException catch (_) {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstants.badResponseFormat);
    }
    return _returnResponse(response);
  }

  static Future<dynamic> httpDeleteRequest(String endPoint,
      {Object? body, String? token}) async {
    http.Response response;
    try {
      response = await client.delete(
          Uri.parse('${AppConstants.apiBaseURL}$endPoint'),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });
    } on SocketException catch (_) {
      throw FetchDataException(AppConstants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(AppConstants.badResponseFormat);
    }
    return _returnResponse(response);
  }
}

dynamic _returnResponse(http.Response response) {
  String responseJson = response.body;
  final jsonResponse = jsonDecode(responseJson);
  switch (response.statusCode) {
    case 200:
      return jsonResponse;
    case 201:
      return jsonResponse;
    case 400:
      throw BadRequestException(
          jsonResponse['message'] ?? AppConstants.exceptionMessage);
    case 401:
      throw InvalidInputException(
          jsonResponse['message'] ?? AppConstants.exceptionMessage);
    case 403:
      throw UnauthorisedException(
          jsonResponse['message'] ?? AppConstants.exceptionMessage);
    case 404:
      throw FetchDataException(
          jsonResponse['message'] ?? AppConstants.exceptionMessage);
    case 500:
    default:
      throw FetchDataException(
          jsonResponse['message'] ?? AppConstants.exceptionMessage);
  }
}
