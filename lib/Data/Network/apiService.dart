import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:Cloudy/Data/Network/baseApiServices.dart';
import 'package:Cloudy/Data/app_exception.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response responce) {
    switch (responce.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(responce.body);
        return jsonResponse;
      case 201:
        var jsonResponse = jsonDecode(responce.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(responce.body);
        return jsonResponse;
      case 404:
        var jsonResponse = jsonDecode(responce.body);
        return jsonResponse;
      default:
        throw FetchDataException(
            'Error While Communication With Server Status Code:${responce.statusCode}');
    }
  }

  @override
  Future getGetApiResponce(String url) async {
    dynamic jsonData;
    try {
      var responce = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw RequestTimeOut("");
      });
      jsonData = jsonResponse(responce);
    } on SocketException {
      throw InternetException("No Internet Connection ");
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout ');
    }
    return jsonData;
  }
}
