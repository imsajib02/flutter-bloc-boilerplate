import '../../../core/abstractions/data_state.dart';
import '../../entities/todo_entity.dart';

abstract class TodosRepository {

  Future<DataState<List<TodoEntity>>> getTodos();
}