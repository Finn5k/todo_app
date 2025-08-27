import 'package:flutter/material.dart';
import 'package:todo_app_finn/design/TopNavBar.dart';
import 'package:todo_app_finn/models/categoryToDo.dart';
import 'package:todo_app_finn/models/shared_preferences.dart';
import 'package:todo_app_finn/pages/createTaskPage.dart';

class Startpage extends StatefulWidget {
  final SharedPref sh;

  const Startpage({super.key, required this.sh});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  void refreshListe() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TopNavbar(titel: 'ToDo-App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('@Finn'),
              accountEmail: Text('finn@finn.de'),
              currentAccountPicture: InkWell(
                onTap: () {},
                child: CircleAvatar(child: Text('F'), radius: 50),
              ),
              onDetailsPressed: () {},
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Übersicht ToDo'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Erstelle ein ToDo'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(sh: widget.sh),
            ),
          );
          refreshListe();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: width < 900 ? width * 3.5 : width / 1.5,

                child: GridView.count(
                  childAspectRatio: 5,
                  crossAxisCount: 2,
                  children: [
                    for (int i = 0; i < widget.sh.categories.length; i++)
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(widget.sh.todoIcons[i]),
                                Text('${widget.sh.categories[i].categoryName}'),
                              ],
                            ),
                            Text(
                              ': ${widget.sh.categoryCounts[i]}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                width: width / 1.5,
                child: widget.sh.getLength() == 0
                    ? Text('Es sind noch keine ToDo´s vorhanden!')
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: widget.sh.getLength(),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: widget.sh.getTask(index).isErledigt
                                ? Colors.green
                                : Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Titel: ${widget.sh.getTask(index).titel}',
                                      ),
                                      Text(
                                        'Beschreibung: ${widget.sh.getTask(index).titel}',
                                      ),
                                      Text(
                                        'Kategorie: ${widget.sh.getTask(index).categoryTD.categoryName}',
                                      ),
                                      Text('Ablaufdatum: ${widget.sh.getTask(index).ablaufDatum.day}.${widget.sh.getTask(index).ablaufDatum.month}.${widget.sh.getTask(index).ablaufDatum.year}')
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Checkbox(
                                    value: widget.sh.getTask(index).isErledigt,
                                    onChanged: (bool? v) {
                                      setState(() {
                                        widget.sh.getTask(index).toggleErledigt();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  refreshListe();
                },
                icon: Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
