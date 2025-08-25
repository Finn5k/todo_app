import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_finn/models/categoryToDo.dart';
import 'package:todo_app_finn/models/task.dart';

class SharedPref {

  final CategoryToDo arbeit = CategoryToDo(categoryName: 'Arbeit');
  final CategoryToDo einkaufsliste = CategoryToDo(categoryName: 'Einkaufsliste');
  final CategoryToDo freizeit = CategoryToDo(categoryName: 'Freizeit');
  final CategoryToDo hobby = CategoryToDo(categoryName: 'Hobby');

  final IconData arbeitIcon = Icons.work;
  final IconData einkaufIcon = Icons.shopping_basket;
  final IconData freizeitIcon = Icons.sports_soccer;
  final IconData hobbyIcon = Icons.free_breakfast_rounded;

  List<IconData> todoIcons = [];
  List<Task> _tasks = [];
  List<CategoryToDo> categories = [];
  List<int> categoryCounts = [0,0,0,0];


  SharedPref() {
    initCategories();
    initIconData();
  }

  void initCategories() {
    categories.add(arbeit);
    categories.add(einkaufsliste);
    categories.add(freizeit);
    categories.add(hobby);
  }

  void initIconData() {
    todoIcons.add(arbeitIcon);
    todoIcons.add(einkaufIcon);
    todoIcons.add(freizeitIcon);
    todoIcons.add(hobbyIcon);
  }

  void addTask(Task t) {
    _tasks.add(t);
  }

  Task getTask(int i) {
    return _tasks[i];
  }

  int getLength() {
    return _tasks.length;
  }
}
