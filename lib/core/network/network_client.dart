import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../constants/localization_constants.dart';
import '../error/exceptions/app_exceptions.dart';
import 'connectivity_status.dart';

abstract class BaseRequest {
  Future<http.BaseResponse> send({required Future<BaseResponse> request});
}

abstract class NetworkRequests extends BaseRequest {

  Future<http.Response> get({required String url});
  Future<http.Response> post({required String url, Map<String, dynamic>? body});
  Future<http.Response> put({required String url, Map<String, dynamic>? body});
  Future<http.Response> patch({required String url, Map<String, dynamic>? body});
  Future<http.Response> delete({required String url, Map<String, dynamic>? body});
  Future<http.Response> singleMultipartRequest({required String url, required String fieldName, required File file});
}

class NetworkClient extends NetworkRequests {

  static const int timeoutInSeconds = 60;

  late Client _client;

  final NetworkInfo connectivityStatus;

  NetworkClient(this.connectivityStatus, List<InterceptorContract> interceptors) {
    _client = InterceptedClient.build(interceptors: interceptors);
  }

  @override
  Future<http.Response> get({required String url}) async {

    try {
      var request = _client.get(Uri.parse(url)).timeout(const Duration(seconds: timeoutInSeconds));
      var response = await send(request: request);
      return response as http.Response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.Response> post({required String url, Map<String, dynamic>? body}) async {

    try {
      var request = _client.post(Uri.parse(url), body: body).timeout(const Duration(seconds: timeoutInSeconds));
      var response = await send(request: request);
      return response as http.Response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.Response> put({required String url, Map<String, dynamic>? body}) async {

    try {
      var request = _client.put(Uri.parse(url), body: body).timeout(const Duration(seconds: timeoutInSeconds));
      var response = await send(request: request);
      return response as http.Response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.Response> patch({required String url, Map<String, dynamic>? body}) async {

    try {
      var request = _client.patch(Uri.parse(url), body: body).timeout(const Duration(seconds: timeoutInSeconds));
      var response = await send(request: request);
      return response as http.Response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.Response> delete({required String url, Map<String, dynamic>? body}) async {

    try {
      var request = _client.delete(Uri.parse(url), body: body).timeout(const Duration(seconds: timeoutInSeconds));
      var response = await send(request: request);
      return response as http.Response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.Response> singleMultipartRequest({required String url, required String fieldName, required File file}) async {

    try {
      var request = _client.send(http.MultipartRequest(HttpMethod.POST.asString, Uri.parse(url))..files.add(
        await http.MultipartFile.fromPath(fieldName, file.path),
      )).timeout(const Duration(seconds: timeoutInSeconds));

      var streamedResponse = await send(request: request);

      var response = await http.Response.fromStream(streamedResponse as http.StreamedResponse);
      return response;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<http.BaseResponse> send({required Future<BaseResponse> request}) async {

    try {
      var isConnected = await connectivityStatus.isConnected();

      if(!isConnected) {
        throw NetworkException(strNoInternet.tr());
      }

      var isConnectionActive = await connectivityStatus.isConnectionActive();

      if(!isConnectionActive) {
        throw NetworkException(strInactiveConnection.tr());
      }

      var response = await request;
      return response;

    } on TimeoutException {
      throw NetworkException(strTimedOut.tr());

    } on NetworkException {
      rethrow;

    } on ResponseException {
      rethrow;

    } catch (_) {
      throw NetworkException(strSomethingWrong.tr());
    }
  }
}