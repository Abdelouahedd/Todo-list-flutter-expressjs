import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Todo.dart';
import 'package:todo/providers/TodoProvider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController taskTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  Widget build(BuildContext context) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: true);

    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(controller: taskTitleController),
                CheckboxListTile(
                  value: completedStatus,
                  onChanged: (checked) => setState(() {
                    completedStatus = checked;
                  }),
                  title: Text('Complete?'),
                ),
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                   Todo newTodo = new Todo(task:taskTitleController.text,time: DateTime.now().millisecondsSinceEpoch,done:completedStatus);
                   todop.addTask(newTodo);
                   taskTitleController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
