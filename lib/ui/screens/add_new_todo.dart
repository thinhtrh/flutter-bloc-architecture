//
// @author thinhth on 12/04/2021
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/models/models.dart';
import 'package:todo_bloc/repositories/repositories.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/utils/utils.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({Key? key}) : super(key: key);

  @override
  AddNewTodoScreenState createState() {
    return AddNewTodoScreenState();
  }
}

class AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosBloc>(
      create: (_) => TodosBloc(
          todosRepository: FireBaseTodosRepository(),
          modalsBloc: context.read<ModalsBloc>()),
      child: MyAppContainer(
        title: Translations.translate("addNewTodo"),
        child: const AddTodoForm(),
      ),
    );
  }
}

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  AddTodoFormState createState() {
    return AddTodoFormState();
  }
}

class AddTodoFormState extends State<AddTodoForm> {
  String taskName = "";

  void onTaskNameChange(String text) {
    setState(() {
      taskName = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      final String id = Uuid().generateV4();
      final String createdDate = DateTime.now().toUtc().toString();

      context
          .read<TodosBloc>()
          .add(AddTodoEvent(Todo(taskName, id, createdDate, "")));
    }

    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(MyMetrics.spacingXL),
        child: Column(
          children: [
            MyTextInput(
              onTextChange: onTaskNameChange,
              autoFocus: true,
            ),
            MyTextButton(
              text: Translations.translate("add"),
              onPress: onAdd,
            ),
          ],
        ),
      );
    });
  }
}
