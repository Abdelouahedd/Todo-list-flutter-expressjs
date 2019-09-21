import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:todo/models/Todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  List<Todo> _listTodo = List<Todo>();

  String _url = "http://192.168.8.104:8000";

  List<Todo> get listTodo => _listTodo;

  set listTodo(List<Todo> val) {
    _listTodo = val;
    notifyListeners();
  }

  List<Todo> get incompletedTask {
    return listTodo.where((t)=>t.done==false).toList();
  }

  Future<List<Todo>> getAllTodo() async {
    http.Response response = await http.get(Uri.parse(_url+"/api/allTodos"));
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
    await http.put(Uri.encodeFull(_url + "/api/upTask/${t.id}"),
        headers: {'Accept': 'application/json'},
        body: {'todo': json.encode(t)}).then((res) {
      getAllTodo();
    });
  }

  Future<void> addTask(Todo t) async {
    await http.post(Uri.encodeFull(_url + "/api/addTask"),
        headers: {'Accept': 'application/json'},
        body: {'todo': json.encode(t)}).then((res) {
      getAllTodo();
    });
  }

  Future<void> deleteTask(Todo t) async {
    final client = http.Client();
    try {
      await client
          .send(http.Request("DELETE", Uri.parse(_url + "/api/delTask/${t.id}"))
            ..body = json.encode(t))
          .then((v) {
        getAllTodo();
      });
    } finally {
      client.close();
    }
  }
}
