import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';
import 'package:todo/widgets/Todo_card.dart';

class IncompletedTodo extends StatefulWidget {
  IncompletedTodo({Key key}) : super(key: key);

  _IncompletedTodoState createState() => _IncompletedTodoState();
}

class _IncompletedTodoState extends State<IncompletedTodo> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Color.fromRGBO(169, 169, 169, 0.9),
      body: todop.incompletedTask.length != 0
          ? ListView.builder(
              itemCount: todop.incompletedTask.length,
              itemBuilder: (context, int i) {
                return TodoCard(todop.incompletedTask[i]);
              },
            )
          : Center(
              child: Container(),
            ),
    );
  }
}
