import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_bloc/entities/todo_entity.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/repositories/todos_repository.dart';

class FireBaseTodosRepository implements TodosRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    return todoCollection.doc(todo.taskId).set(todo.toEntity().toDocument());
  }

  @override
  Stream<List<Todo>> getTodos() {
    return todoCollection.snapshots().map((event) {
      return event.docs
          .map((e) => Todo.fromEntity(TodoEntity.fromSnapshot(e)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return todoCollection.doc(todo.taskId).update(todo.toEntity().toDocument());
  }

  @override
  Future<void> getTodo(String taskId) {
    return todoCollection.where('taskId', isEqualTo: taskId).get();
  }
}
