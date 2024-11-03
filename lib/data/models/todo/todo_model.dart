import '../../../core/abstractions/entity_convertible.dart';
import '../../../domain/entities/todo_entity.dart';

part 'todo_mapper.dart';

class TodoModel implements EntityConvertible<TodoModel, TodoEntity> {

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const TodoModel({this.userId, this.id, this.title, this.completed});

  @override
  TodoModel fromEntity(TodoEntity entity) => throw UnimplementedError();

  @override
  TodoEntity toEntity() => TodoEntity(
    userId: userId,
    id: id,
    title: title,
    completed: completed,
  );

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}