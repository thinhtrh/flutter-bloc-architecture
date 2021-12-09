import 'package:bloc/bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/blocs/todos/todos_event.dart';
import 'package:todo_bloc/blocs/todos/todos_state.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/repositories/todos_repository.dart';
import 'package:todo_bloc/utils/utils.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(
      {required TodosRepository todosRepository,
      required ModalsBloc modalsBloc})
      : _todosRepository = todosRepository,
        _modalsBloc = modalsBloc,
        super(const TodosState()) {
    on<AddTodoEvent>(onAddTodo);
    on<GetTodosEvent>(onGetTodos);
    on<TodosUpdatedEvent>(onTodosUpdated);
    on<UpdateTodoEvent>(onUpdateTodo);
  }
  final TodosRepository _todosRepository;
  final ModalsBloc _modalsBloc;

  Future<void> onAddTodo(AddTodoEvent event, Emitter<TodosState> emit) async {
    emit(state.copyWith(fetching: true));
    _modalsBloc.add(ShowLoadingEvent());
    await _todosRepository.addNewTodo(event.todo);
    emit(state.copyWith(fetching: false));
    _modalsBloc.add(HideLoadingEvent());
    Navigation.pop();
  }

  Future<void> onUpdateTodo(
      UpdateTodoEvent event, Emitter<TodosState> emit) async {
    emit(state.copyWith(fetching: true));
    _modalsBloc.add(ShowLoadingEvent());
    await _todosRepository.updateTodo(event.todo);
    emit(state.copyWith(fetching: false));
  }

  Future<void> onGetTodos(GetTodosEvent event, Emitter<TodosState> emit) {
    emit(state.copyWith(fetching: true));
    _modalsBloc.add(ShowLoadingEvent());
    return emit.onEach<List<Todo>>(_todosRepository.getTodos(),
        onData: (todos) {
      return add(TodosUpdatedEvent(todos));
    });
  }

  void onTodosUpdated(TodosUpdatedEvent event, Emitter<TodosState> emit) {
    emit(state.copyWith(fetching: false, todoList: event.todos));
    _modalsBloc.add(HideLoadingEvent());
  }
}
