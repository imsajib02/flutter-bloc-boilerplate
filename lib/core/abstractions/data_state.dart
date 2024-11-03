import '../error/failures/failure.dart';

abstract class DataState<T> {

  final T? data;
  final Failure? failure;

  const DataState({this.data, this.failure});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data): super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError([Failure? failure]): super(failure: failure);
}