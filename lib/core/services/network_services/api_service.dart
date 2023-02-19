import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'execeptions.dart';
import 'network_constant.dart';

class APIService {
  static const int timeOutDuration = 35;

  Future<dynamic> get({
  required String route,
    required Map<String,String> query,
}) async {
    try {
      final url = Uri.https(baseUrl,route,query);
      final http.Response response = await http.get(url).timeout(
          const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    }catch(e){
      throw ExceptionHandlers().getExceptionString(e);
    }
  }





  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<String,dynamic> responseJson =jsonDecode(response.body);
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}