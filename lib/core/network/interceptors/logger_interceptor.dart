import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../../utils/custom_log.dart';
import '../../utils/custom_trace.dart';

class LoggerInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {

    if(kDebugMode) {
      log('\n<----------  Network Request  ---------->\n');
      log('Url: ${request.url.toString()}');
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {

    Response? mResponse;

    if(response is Response) {
      mResponse = response;
    }

    if(response is StreamedResponse) {

      final bytes = await _getBytesFromStreamedResponse(response);

      var streamedResponse = _createMultiListenableStreamedResponse(bytes, response);

      mResponse = await Response.fromStream(streamedResponse);
      _logResponse(mResponse);

      return streamedResponse;
    }

    _logResponse(mResponse);

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => true;

  void _logResponse(Response? response) {

    if(kDebugMode && response != null) {
      log('Code: ${response.statusCode}');
      CustomLogger.debug(trace: CustomTrace(StackTrace.current), tag: 'Response', message: response.body);
    }
  }

  Future<Uint8List> _getBytesFromStreamedResponse(StreamedResponse response) async {

    final completer = Completer<Uint8List>();
    final List<int> data = [];

    response.stream.listen((chunk) {
        data.addAll(chunk);
      },
      onDone: () {
        completer.complete(Uint8List.fromList(data));
      },
      onError: (error) {
        completer.completeError(error);
      },
    );

    return completer.future;
  }

  StreamedResponse _createMultiListenableStreamedResponse(Uint8List bytes, StreamedResponse originalResponse) {

    final byteStream = Stream<Uint8List>.fromIterable([bytes]);

    return StreamedResponse(
      byteStream,
      originalResponse.statusCode,
      headers: originalResponse.headers,
      isRedirect: originalResponse.isRedirect,
      persistentConnection: originalResponse.persistentConnection,
      reasonPhrase: originalResponse.reasonPhrase,
    );
  }
}