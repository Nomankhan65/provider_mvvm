import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {

    dynamic responseJson;

    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(dynamic data,String url) async {

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response =
      await http.post(Uri.parse(url),
        body:data,
      ).timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw  BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw  UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occur while communicating with server${response.statusCode}');
    }
  }
}
