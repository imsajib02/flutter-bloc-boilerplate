import '../../../core/abstractions/data_state.dart';
import '../../entities/todo_entity.dart';
import '../../repositories/todos/todos_repository.dart';

class TodosUseCase {

  final TodosRepository _todosRepository;

  const TodosUseCase(this._todosRepository);

  Future<DataState<List<TodoEntity>>> getTodos() async =>
      _todosRepository.getTodos();
}