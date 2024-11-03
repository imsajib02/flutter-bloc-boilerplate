import 'package:flutter/material.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../core/styles/text_styles.dart';
import '../../../domain/entities/todo_entity.dart';

class TodoCard extends StatelessWidget {
  
  final TodoEntity? todo;
  
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 0,
      color: white,
      surfaceTintColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Checkbox(
            value: todo?.completed,
            activeColor: Theme.of(context).primaryColor,
            onChanged: null,
          ),
          title: Text(todo?.title ?? '',
            style: TextStyles.titleStyle,
          ),
          isThreeLine: false,
          dense: true,
        ),
      ),
    );
  }
}
