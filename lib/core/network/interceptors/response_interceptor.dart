import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../../constants/localization_constants.dart';
import '../../error/exceptions/app_exceptions.dart';

class ResponseInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async => request;

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {

    if(response.statusCode != HttpStatus.ok && response.statusCode != HttpStatus.created && response.statusCode != HttpStatus.accepted) {
      throw NetworkException(strSomethingWrong.tr());
    }

    if(response is Response) {

      var jsonData = json.decode(response.body);

      if(jsonData['status'] == null || !jsonData['status']) {
        throw ResponseException(jsonData);
      }
    }

    if(response is StreamedResponse) {

      var responseFromStream = await Response.fromStream(response);

      var jsonData = json.decode(responseFromStream.body);

      if(jsonData['status'] == null || !jsonData['status']) {
        throw ResponseException(jsonData);
      }
    }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => false;

  @override
  Future<bool> shouldInterceptResponse() async => true;
}