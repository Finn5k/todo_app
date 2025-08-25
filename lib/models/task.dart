import 'package:todo_app_finn/models/categoryToDo.dart';

class Task {
  String titel;
  String beschreibung;
  bool isErledigt;
  CategoryToDo categoryTD;

  Task({required this.titel, required this.beschreibung, this.isErledigt = false, required this.categoryTD});

  void toggleErledigt() {
    if(this.isErledigt){
      this.isErledigt = false;
    } else {
      this.isErledigt = true;
    }
  }


}