import 'package:equatable/equatable.dart';
import 'package:todo_bloc/entities/todo_entity.dart';

enum TaskStatuses { done, active }

class Todo extends Equatable {
  const Todo(this.taskName, this.taskId, this.createdDate, this.finishedDate,
      {this.status = 'ACTIVE'});

  final String taskName;
  final String status;
  final String taskId;
  final String createdDate;
  final String finishedDate;

  @override
  List<Object?> get props =>
      [taskName, status, taskId, createdDate, finishedDate];

  TodoEntity toEntity() {
    return TodoEntity(taskName, status, taskId, createdDate, finishedDate);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
        entity.taskName, entity.taskId, entity.createdDate, entity.finishedDate,
        status: entity.status);
  }
}
