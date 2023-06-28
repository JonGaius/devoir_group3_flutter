import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Group 3", "group_3");
  Color colorWhite = Colors.white;
  Color colorBlack = Colors.black;
  Color colorBorder = Colors.grey.shade500;
  Color colorBackground2 = Colors.grey.shade50;
  Color colorLevel1 = Colors.pinkAccent.shade100;
  Color colorLevel2 = Colors.pinkAccent.shade200;
  Color colorLevel3 = Colors.pinkAccent.shade400;
  Color colorLevel4 = Colors.pinkAccent.shade700;

  int get numTasks => tasks.length;
  int get numCompletedTasks => tasks.where((task) => task.completed).length;

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  String getTaskTitle(int tabIndex) {
    return tasks[tabIndex].title;
  }

  bool getTaskValue(int tabIndex) {
    return tasks[tabIndex].completed;
  }
  void setTaskValue(int tabIndex, bool taskValue){
    tasks[tabIndex].completed = taskValue;
    notifyListeners();
  }

  void deleteTask(int tabIndex){
    tasks.removeAt(tabIndex);
    notifyListeners();
  }

  void deleteAllTasks(){
    tasks.clear();
    notifyListeners();
  }
  void deleteCompletedTasks(){
    tasks = tasks.where((task) => !task.completed).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      context: context,
      builder: ((context) {
        return bottomSheetView;
      })
    );
  }
}