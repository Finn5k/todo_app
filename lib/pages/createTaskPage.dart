import 'package:flutter/material.dart';
import 'package:todo_app_finn/models/categoryToDo.dart';
import 'package:todo_app_finn/models/shared_preferences.dart';
import 'package:todo_app_finn/models/task.dart';

class CreateTaskPage extends StatefulWidget {

  final SharedPref sh;

  const CreateTaskPage({super.key, required this.sh});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titelController = TextEditingController();
  TextEditingController beschreibungController = TextEditingController();

  CategoryToDo currCategory = CategoryToDo(categoryName: 'Sonstige');
  CategoryToDo checkCategory = CategoryToDo(categoryName: 'Sonstige');

  @override
  void dispose() {
    beschreibungController.dispose();
    titelController.dispose();
    super.dispose();
  }

  void _createTask() {
    String titel = titelController.text;
    String beschreibung = beschreibungController.text;

    Task t = Task(titel: titel, beschreibung: beschreibung, categoryTD: currCategory);
    Navigator.pop(context);
    widget.sh.addTask(t);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Erstelle eine Aufgabe'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          height: height/1.2,
          width: width / 2,
          child: Column(
            children: [
              EingabeFeld(labelT: 'Titel', controller: titelController),
              EingabeFeld(labelT: 'Bezeichnung', controller: beschreibungController),
              DropdownMenu(
                onSelected: (CategoryToDo) {
                  if(CategoryToDo != null){
                    setState(() {
                      currCategory = CategoryToDo;
                    });
                  }
                },
                  enableSearch: false,
                  hintText: 'Wähle eine Kategorie',
                  dropdownMenuEntries: <DropdownMenuEntry<CategoryToDo>>[
                    DropdownMenuEntry(value: widget.sh.arbeit, label: 'Arbeit'),
                    DropdownMenuEntry(value: widget.sh.einkaufsliste, label: 'Einkaufsliste'),
                    DropdownMenuEntry(value: widget.sh.freizeit, label: 'Freizeit'),
                    DropdownMenuEntry(value: widget.sh.hobby, label: 'Hobby'),
                  ]
              ),
              ElevatedButton(
                onPressed: () {
                  if(currCategory.categoryName.compareTo(checkCategory.categoryName) == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wähle eine Kategorie, um fortzufahren')));
                    return;
                  }
                  switch(currCategory.categoryName) {
                    case 'Arbeit' : widget.sh.categoryCounts[0]++; break;
                    case 'Einkaufsliste' : widget.sh.categoryCounts[1]++; break;
                    case 'Freizeit' : widget.sh.categoryCounts[2]++; break;
                    case 'Hobby' : widget.sh.categoryCounts[3]++; break;
                  }
                  _createTask();
                },
                child: Row(children: [Text('Bestätigen'), Icon(Icons.add)]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EingabeFeld extends StatefulWidget {
  final String labelT;
  final TextEditingController controller;

  const EingabeFeld({super.key, required this.labelT, required this.controller});

  @override
  State<EingabeFeld> createState() => _EingabeFeldState();
}

class _EingabeFeldState extends State<EingabeFeld> {
  late String input;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: true,
      decoration: InputDecoration(labelText: widget.labelT),
      controller: widget.controller,
    );
  }
}
