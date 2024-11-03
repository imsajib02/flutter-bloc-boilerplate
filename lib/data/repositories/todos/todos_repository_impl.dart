import 'package:easy_localization/easy_localization.dart';

import '../../../core/abstractions/data_state.dart';
import '../../../core/constants/localization_constants.dart';
import '../../../core/error/exceptions/app_exceptions.dart';
import '../../../core/error/failures/failure.dart';
import '../../../domain/entities/todo_entity.dart';
import '../../../domain/repositories/todos/todos_repository.dart';
import '../../../injector.dart';
import '../../datasources/remote/todos/todos_remote_data_source.dart';

class TodosRepositoryImpl implements TodosRepository {

  final TodosRemoteDataSource _remoteDataSource;

  TodosRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<List<TodoEntity>>> getTodos() async {

    try {
      final result = await _remoteDataSource.getTodos();
      return DataSuccess(List<TodoEntity>.from(result.map((item) => item.toEntity())));

    } on NetworkException catch (error) {
      return DataError(Failure(errorMessage: error.message));

    } on ResponseException catch (error) {
      return DataError(Failure(errorCode: error.response['code'], errorMessage: injector.errorParser.getMessage(error.response)));

    } catch(error) {
      return DataError(Failure(errorMessage: strSomethingWrong.tr()));
    }
  }
}