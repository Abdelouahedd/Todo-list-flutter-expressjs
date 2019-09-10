import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';
import 'package:todo/screens/AddTodo.dart';
import 'package:todo/widgets/Todo_card.dart';

class AllTodo extends StatelessWidget {
  AllTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: true);
    //todop.getAllTodo();
    return Consumer<TodoProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          body: todop.listTodo != null
              ? ListView.builder(
                  itemCount: todop.listTodo.length,
                  itemBuilder: (context, int i) {
                    return TodoCard(todop.listTodo[i]);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
                floatingActionButton: FlatButton(
                  child: new Text("data"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>new AddTodo()
                    ),);
                  },
                ),
        
        );
      },
    );
  }
}
