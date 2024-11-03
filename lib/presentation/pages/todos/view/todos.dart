import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/localization_constants.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../injector.dart';
import '../../../bloc/todos/todos_bloc.dart';
import '../../../components/appbar/my_app_bar.dart';
import '../../../components/cards/todo_card.dart';
import '../../../components/others/error_view.dart';
import '../../../components/others/loader.dart';

class Todos extends StatelessWidget {

  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(
        title: context.tr(strMyTodoList),
        backButtonEnabled: false,
        onBackPressed: () {},
      ),
      body: BlocProvider(
        create: (context) => TodosBloc(injector.todosUseCase)..add(OnStart()),
        child: BlocBuilder<TodosBloc, TodosState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {

            return SafeArea(
              child: IndexedStack(
                index: state.index,
                children: [

                  const Loader(),

                  ErrorView(
                    errorMessage: state.errorMessage,
                    onBtnPressed: () => context.read<TodosBloc>().add(OnStart()),
                  ),

                  _buildTodoList(context.read<TodosBloc>()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTodoList(TodosBloc todosBloc) {

    return BlocBuilder<TodosBloc, TodosState>(
      bloc: todosBloc,
      builder: (context, state) {

        return ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.todoList.length,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          separatorBuilder: (context, index) => 5.h,
          itemBuilder: (context, index) {

            return TodoCard(
              todo: state.todoList[index],
            );
          },
        );
      },
    );
  }
}
