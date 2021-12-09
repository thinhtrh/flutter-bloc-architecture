import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo.dart';

class TodosState extends Equatable {
  const TodosState({this.isFetching = false, this.todos});
  final bool isFetching;
  final List<Todo>? todos;

  @override
  List<Object?> get props => [isFetching, todos];

  // TodosState copyWith({
  //   ValueGetter<bool>? fetching,
  //   ValueGetter<List<Todo>?>? todoList,
  // }) {
  //   return TodosState(
  //       isFetching: fetching != null ? fetching() : isFetching,
  //       todos: todoList != null ? todoList() : todos);
  // }

  TodosState copyWith({
    bool? fetching,
    List<Todo>? todoList,
  }) {
    return TodosState(
        isFetching: fetching ?? isFetching, todos: todoList ?? todos);
  }
}

// class TodosLoadInProgress extends TodosState {}
//
// class TodosLoading extends TodosState {
//   const TodosLoading();
// }
//
// class TodosLoadSuccess extends TodosState {
//   final List<Todo> todos;
//
//   const TodosLoadSuccess([this.todos = const []]);
//
//   @override
//   List<Object?> get props => [todos];
//
//   @override
//   String toString() {
//     return 'TodosLoadSuccess {todos: $todos}';
//   }
// }
//
// class TodosLoadFailure extends TodosState {}
