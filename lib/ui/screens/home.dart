import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/repositories/repositories.dart';
import 'package:todo_bloc/ui/ui.dart';
import 'package:todo_bloc/ui/widgets/my_switch_language.dart';
import 'package:todo_bloc/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.locale; // trigger to reload widget after language was changed
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
            create: (context) => TodosBloc(
                todosRepository: FireBaseTodosRepository(),
                modalsBloc: context.read<ModalsBloc>())
              ..add(GetTodosEvent())),
      ],
      child: MyAppContainer(
        child: const TodoList(),
        leftWidget: const MySwitchLanguage(),
        rightWidget: const AddNewTodoButton(),
        title: Translations.translate("todoList"),
      ),
    );
  }
}

class AddNewTodoButton extends StatelessWidget {
  const AddNewTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToAddNewTodo() {
      Navigation.push(MainRoutes.addNewTodo);
    }

    return MyIconButton(
      icon: Icons.add,
      onPress: goToAddNewTodo,
      alignment: Alignment.centerRight,
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      final modalsBloc = context.read<ModalsBloc>();
      final todosBloc = context.read<TodosBloc>();

      final todos = state.todos ?? [];
      final isFetching = state.isFetching;

      void changeStatus(Todo todo) {
        final finishedDate = DateTime.now().toUtc().toString();
        Todo updatedTodo = Todo(
            todo.taskName, todo.taskId, todo.createdDate, finishedDate,
            status: 'DONE');
        todosBloc.add(UpdateTodoEvent(updatedTodo));
      }

      void onChangeStatus(Todo todo) {
        if (todo.status == 'DONE') return;

        Widget confirmModal = ConfirmationModal(
          onSubmit: () {
            changeStatus(todo);
          },
          content: Translations.translate("updateTodoMessage"),
        );

        modalsBloc.add(DisplayModal1Event(confirmModal));
      }

      return Expanded(
        child: Container(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MyMetrics.getBottomPadding(context)),
            child: todos.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.fromLTRB(MyMetrics.spacingXL,
                        MyMetrics.spacingXL, MyMetrics.spacingXL, 0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoItem(
                          todo: todos[index],
                          onChangeStatus: () {
                            onChangeStatus(todos[index]);
                          });
                    },
                  )
                : Center(
                    child: isFetching
                        ? Container()
                        : const MyText(text: 'No items'))),
      );
    });
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo, this.onChangeStatus})
      : super(key: key);

  final Todo todo;
  final VoidCallback? onChangeStatus;

  @override
  Widget build(BuildContext context) {
    context.locale; // trigger to reload widget after language was changed
    final VoidCallback onChangeStatusPressed = onChangeStatus ?? () {};
    return Container(
      decoration: BoxDecoration(
          color: MyColors.grey, borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.fromLTRB(0, 0, 0, MyMetrics.spacingS),
      padding: EdgeInsets.all(MyMetrics.spacingL),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: todo.taskName,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: MyFonts.contentSize,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: Translations.translate("created_date") + ':',
                      style: TextStyle(
                          fontSize: MyFonts.smallSize,
                          fontWeight: FontWeight.w300),
                    ),
                    MyText(
                        text: Dates.convertUTCToLocalTime(todo.createdDate,
                            format: 'HH:mm, dd/MM/yy'),
                        style: TextStyle(
                            fontSize: MyFonts.smallSize,
                            fontWeight: FontWeight.w600))
                  ],
                )
              ],
            )),
            Container(
              width: MyMetrics.spacingM,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyIconButton(
                  icon: todo.status == 'DONE'
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: MyColors.green,
                  onPress: onChangeStatusPressed,
                  alignment: Alignment.topRight,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyText(
                      text: Translations.translate("finished_date") + ':',
                      style: TextStyle(
                          fontSize: MyFonts.smallSize,
                          fontWeight: FontWeight.w300),
                    ),
                    MyText(
                        text: Dates.convertUTCToLocalTime(todo.finishedDate,
                            format: 'HH:mm, dd/MM/yy'),
                        style: TextStyle(
                            fontSize: MyFonts.smallSize,
                            fontWeight: FontWeight.w600))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
