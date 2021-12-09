//
// @author thinhth on 12/04/2021
//

import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/ui.dart';

class TodoDetailScreen extends StatefulWidget {
  const TodoDetailScreen({Key? key}) : super(key: key);

  @override
  TodoDetailScreenState createState() {
    return TodoDetailScreenState();
  }
}

class TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const MyAppContainer(
      title: "Todo Detail",
    );
  }
}
