import 'package:http_interceptor/http_interceptor.dart';

import '../../storage/hive_storage_manager.dart';

class AuthorizationInterceptor implements InterceptorContract {

  final HiveStorageManager storageManager;

  const AuthorizationInterceptor(this.storageManager);

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {

    if(storageManager.auth != null) {
      request.headers['Authorization'] = storageManager.auth!.keyWithToken;
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async => response;

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => true;
}