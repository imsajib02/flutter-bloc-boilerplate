import 'dart:convert';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/network_client.dart';
import '../../../models/todo/todo_model.dart';
import 'todos_remote_data_source.dart';

class TodosRemoteDataSourceImpl implements TodosRemoteDataSource {

  final NetworkClient _networkClient;

  const TodosRemoteDataSourceImpl(this._networkClient);

  @override
  Future<List<TodoModel>> getTodos() async {

    try {
      final response = await _networkClient.get(url: todosUrl);

      var jsonData = json.decode(response.body);

      List<TodoModel> todoList = [];

      if(jsonData != null) {
        todoList = List<TodoModel>.from(jsonData.map((data) => TodoModel.fromJson(data)));
      }

      return todoList;

    } catch (_) {
      rethrow;
    }
  }
}