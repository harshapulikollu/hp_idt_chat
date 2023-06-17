import 'dart:convert';
import 'dart:io';

import 'package:hp_idt_chat_test/util/exceptions/network.dart';
import 'package:http/http.dart' as http;

///Helper class for [GET] API call
class BaseApiHelper {
  final String _baseUrl = "https://jefe-stg-media-bucket.s3.amazonaws.com";

  ///Method to make [GET] API calls to url
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  ///Common method to parse the response and throw custom exception if necessary
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // inorder to fix the json decode failing due to extra ',' at last of the list
        String bodyRes = response.body.trim();
        bodyRes = bodyRes.endsWith(',]') ? bodyRes.replaceFirst(',]', ']', bodyRes.length - 2) : bodyRes;
        var responseJson = json.decode(bodyRes);
        return responseJson;
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Something went wrong with StatusCode : ${response.statusCode}');
    }
  }
}