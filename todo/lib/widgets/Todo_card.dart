import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Todo.dart';
import 'package:todo/providers/TodoProvider.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  TodoCard(this.todo);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  Todo get todo => widget.todo;

  @override
  Widget build(BuildContext context) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Center(
        child: buildTitle(todop),
      ),
    );
  }

  Widget buildTitle(TodoProvider p) {
    return ListTile(
      leading: Checkbox(
        value: todo.done == null ? false : todo.done,
        onChanged: (bool v) async {
          this.setState(() {
            p.toggleTodo(todo);
          });
        },
      ),
      title: Text(
        todo.task,
        style: TextStyle(
            fontSize: 16.0,
            color: todo.done ? Colors.grey[300] : Colors.black,
            fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () async {
          p.deleteTask(todo);
        },
      ),
    );
  }
}
