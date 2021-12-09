import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class GetTodosEvent extends TodosEvent {}

class AddTodoEvent extends TodosEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class UpdateTodoEvent extends TodosEvent {
  final Todo todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosUpdatedEvent extends TodosEvent {
  final List<Todo> todos;

  const TodosUpdatedEvent(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodoDeletedEvent extends TodosEvent {}
