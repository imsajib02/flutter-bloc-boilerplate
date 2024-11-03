import '../error/failures/failure.dart';

abstract class NetworkResultHandler<T> {

  void onSuccess([T? data]);
  void onFailure([Failure? failure]);
}