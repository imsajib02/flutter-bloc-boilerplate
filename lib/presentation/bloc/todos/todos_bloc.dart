import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/abstractions/data_state.dart';
import '../../../domain/entities/todo_entity.dart';
import '../../../domain/usecases/todos/todos_use_case.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

  final TodosUseCase _todosUseCase;

  TodosBloc(this._todosUseCase) : super(const TodosState()) {
    on<OnStart>(_getTodos);
  }

  Future<void> _getTodos(TodosEvent event, Emitter<TodosState> emit) async {

    emit(state.copyWith(
        index: 0,
        errorMessage: ''),
    );

    final result = await _todosUseCase.getTodos(); // Network API request

    _handleResult(result, emit);
  }

  void _handleResult(DataState result, Emitter<TodosState> emit) {

    if(result is DataError) { // Response has error. Exception or invalid data.
      _handleDataError(result, emit);
      return;
    }

    // Valid response
    emit(state.copyWith(
        index: 2,
        errorMessage: '',
        todoList: (result as DataSuccess).data as List<TodoEntity>),
    );
  }

  void _handleDataError(DataError error, Emitter<TodosState> emit) {
    // show error view
    emit(state.copyWith(
        index: 1,
        errorMessage: error.failure?.errorMessage ?? ''),
    );
  }
}
