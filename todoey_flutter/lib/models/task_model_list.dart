import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task_model.dart';

class TaskModelList extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  int getLength() {
    return _tasks.length;
  }

  List<Task> getTasks() {
    return _tasks;
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void remove(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
