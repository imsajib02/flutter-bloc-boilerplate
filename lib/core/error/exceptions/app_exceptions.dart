abstract class AppException implements Exception {

  final Object obj;

  const AppException(this.obj);
}

class NetworkException extends AppException {

  final String message;

  const NetworkException(this.message) : super(message);
}

class ResponseException extends AppException {

  final Map<String, dynamic> response;

  const ResponseException(this.response) : super(response);
}