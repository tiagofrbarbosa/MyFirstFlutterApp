import 'package:flutter/material.dart';

import '../components/task.dart';


class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required Widget child}) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter',
        'assets/images/Eu7m692XIAEvxxP.png',
        3),
    Task(
      'Andar de Bike',
      'assets/images/cycling-bike-trail-sport-161172.jpeg',
      2,),
    Task(
      'Meditar',
      'assets/images/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
      5,),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
