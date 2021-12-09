//
// @author thinhth on 12/04/2021
//

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/ui.dart';

class MainRoutes {
  static const home = "home";
  static const addNewTodo = "addNewTodo";
  static const todoDetail = "todoDetail";

  // static Map<String, Widget Function(BuildContext)> routes(
  //     BuildContext context) {
  //   return {
  //     home: (context) => MultiBlocProvider(providers: [
  //           BlocProvider<TodosBloc>(
  //               create: (_) =>
  //                   TodosBloc(todosRepository: FireBaseTodosRepository())
  //                     ..add(GetTodos()))
  //         ], child: const HomeScreen())
  //   };
  // }

  static Route onGenerateRoute(settings) {
    switch (settings.name) {
      case MainRoutes.home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());
      case MainRoutes.addNewTodo:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AddNewTodoScreen());
      case MainRoutes.todoDetail:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const TodoDetailScreen());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => Container());
    }
  }
}
