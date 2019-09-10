import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';

import 'AllTodo.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    return Consumer<TodoProvider>(
      builder: (cnx, TodoProvider, _) => new AllTodo(),
    );
  }
}
