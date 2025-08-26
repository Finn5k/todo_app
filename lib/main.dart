import 'package:flutter/material.dart';
import 'package:todo_app_finn/models/shared_preferences.dart';
import 'package:todo_app_finn/pages/createTaskPage.dart';
import 'package:todo_app_finn/pages/createUser.dart';
import 'package:todo_app_finn/pages/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SharedPref sh = SharedPref();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/CreateTask': (context) => CreateTaskPage(sh: sh,),
        '/CreateUser': (context) => CreateUser(),
        '/Login' : (context) => LoginPage(),
      },
      // home: Startpage(sh: sh,),
      home: CreateUser(),
    );
  }
}
