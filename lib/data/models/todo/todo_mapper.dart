part of 'todo_model.dart';

TodoModel _$fromJson(Map<String, dynamic> json) => TodoModel(
  userId: json['userId'] as int?,
  id: json['id'] as int?,
  title: json['title'] as String?,
  completed: json['completed'] as bool?,
);

@override
Map<String, dynamic> _$toJson(TodoModel model) => {
  'userId': model.userId,
  'id': model.id,
  'title': model.title,
  'completed': model.completed,
};