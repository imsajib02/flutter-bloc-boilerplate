import '../../../models/todo/todo_model.dart';

abstract class TodosRemoteDataSource {

  Future<List<TodoModel>> getTodos();
}