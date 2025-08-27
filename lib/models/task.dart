import 'package:todo_app_finn/models/categoryToDo.dart';

class Task {
  String titel;
  String beschreibung;
  bool isErledigt;
  CategoryToDo categoryTD;
  DateTime ablaufDatum;

  Task({required this.titel, required this.beschreibung, this.isErledigt = false, required this.categoryTD, required this.ablaufDatum});

  void toggleErledigt() {
    if(this.isErledigt){
      this.isErledigt = false;
    } else {
      this.isErledigt = true;
    }
  }


}