import 'package:todo_bloc/models/todo.dart';

abstract class TodosRepository {
  Future<void> addNewTodo(Todo todo);
  Future<void> getTodo(String taskId);
  Future<void> updateTodo(Todo todo);
  Stream<List<Todo>> getTodos();
}
