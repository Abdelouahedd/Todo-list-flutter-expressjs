import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:todo/models/Todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  List<Todo> _listTodo = List<Todo>();
  String _url = "http://192.168.8.103:8000/api/allTodos";

  List<Todo> get listTodo => _listTodo;

  set listTodo(List<Todo> val) {
    _listTodo = val;
    notifyListeners();
  }

  Future<List<Todo>> getAllTodo() async {
    http.Response response = await http.get(Uri.parse(_url));
    List responseJson = json.decode(response.body);
    List<Todo> data = [];
    for (var item in responseJson) {
      data.add(new Todo.fromJson(item));
    }
    listTodo = data;

    return listTodo;
  }

  void toggleTodo(Todo task) {
    final taskIndex = _listTodo.indexOf(task);
    _listTodo[taskIndex].toggleCompleted();
    togeleTodof(_listTodo[taskIndex]);
    notifyListeners();
  }

  Future<void> togeleTodof(Todo t) async {
    String _urlt = "http://192.168.8.103:8000/api/upTask/${t.id}";
    await http.put(Uri.encodeFull(_urlt),
        headers: {'Accept': 'application/json'},
        body: {'todo': json.encode(t)}).then((res) {
      getAllTodo();
    });
  }
}
