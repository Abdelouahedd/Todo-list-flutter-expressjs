class Todo {
  String id;
  String task;
  int time;
  bool done;

  Todo(this.id, this.task, this.time, this.done);
  
  void toggleCompleted() {
    done = !done;
  }

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    task = json['task'] as String;
    time = json['time'] as int;
    done = json['done'] as bool;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] =  this.id;
    data['task'] = this.task;
    data['time'] = this.time;
    data['done'] = this.done;
    return data;
  }
}
