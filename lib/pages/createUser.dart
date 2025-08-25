import 'package:flutter/material.dart';

class CreateUser extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Login'),
            Container(
              child: Column(
                children: [
                  Text('Benutzername'),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Gib einen Benutzername ein',
                    ),
                  ),
                  Text('E-Mail'),
                  TextFormField(
                    initialValue: 'Test',
                  ),
                  Text('Password'),
                  TextFormField(

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}