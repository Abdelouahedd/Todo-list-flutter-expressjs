import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/TodoProvider.dart';
import 'package:todo/screens/AddTodo.dart';
import 'package:todo/widgets/Todo_card.dart';

class AllTodo extends StatefulWidget {
  AllTodo({Key key}) : super(key: key);

  @override
  _AllTodoState createState() => _AllTodoState();
}

class _AllTodoState extends State<AllTodo> {
  showCart() {
    showModalBottomSheet(
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      context: context,
      builder: (context) => AddTodo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TodoProvider todop = Provider.of<TodoProvider>(context, listen: true);
    //todop.getAllTodo();

    void _showDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              content: Container(
                height: 300,
                child: AddTodo(),
              ),
            );
          });
    }

    return Consumer<TodoProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(169, 169, 169, 0.9),
          body: todop.listTodo.length != 0
              ? ListView.builder(
                  itemCount: todop.listTodo.length,
                  itemBuilder: (context, int i) {
                    return TodoCard(todop.listTodo[i]);
                  },
                )
              : Center(
                    child:new Text("Add new tasks",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Big_Shoulders_Display",

                    ),),
                  ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (mounted) {
                _showDialog();
              }
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
