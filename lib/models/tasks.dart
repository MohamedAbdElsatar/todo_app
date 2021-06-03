import 'package:flutter/cupertino.dart';

class TaskItem {
  final String title;
  final String id;
  bool isDone;

  TaskItem({
    required this.title,
    required this.id,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

class Tasks with ChangeNotifier {
  List<TaskItem> _tasks = [
    TaskItem(title: 'Study English and Math Play football at nightPlay football at nightPlay football at night', id: 't3'),
    TaskItem(title: 'Play football at night', id: 't1'),
    TaskItem(title: 'Watch the match', id: 't2'),
    TaskItem(title: 'Go to my uncle', id: 't4'),
    TaskItem(title: 'Study English and Math', id: 't0'),
    TaskItem(title: 'Watch the match', id: 't-15'),
    TaskItem(title: 'Go to the  school', id: 't-45'),
    TaskItem(title: 'play music', id: 't-155'),
    TaskItem(title: 'Go to my uncle', id: 't-415'),
        TaskItem(title: 'play music', id: 't-1105'),
    TaskItem(title: 'Go to my uncle', id: 't-4135'),

   
  ];

  List<TaskItem> get task {
    return [..._tasks];
  }

  void addTask(title, id) {
    _tasks.add(TaskItem(title: title, id: id));
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);

    notifyListeners();
  }


  void updateTask(TaskItem task) {
    task.toggleDone();
    notifyListeners();
  }
}
