part of 'todos_bloc.dart';

class TodosState extends Equatable {

  final int index;
  final String errorMessage;
  final List<TodoEntity> todoList;

  const TodosState({this.index = 0, this.errorMessage = '', this.todoList = const []});

  @override
  List<Object?> get props => [index, errorMessage, todoList];

  TodosState copyWith({int? index, String? errorMessage, List<TodoEntity>? todoList}) {

    return TodosState(
      index: index ?? this.index,
      errorMessage: errorMessage ?? this.errorMessage,
      todoList: todoList ?? this.todoList,
    );
  }
}
