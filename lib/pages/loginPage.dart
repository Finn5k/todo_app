import 'package:flutter/material.dart';
import 'package:todo_app_finn/design/EingabeFeldUser.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showInputPW = true;
  String _password = '';
  TextEditingController benutzerNameController = TextEditingController();
  TextEditingController passwortController = TextEditingController();


  void _togglePW() {
    setState(() {
      _showInputPW = !_showInputPW;
    });
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                width: 300,
                margin: EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                  horizontal: 55,
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    EingabeFeldUser(
                      controller: benutzerNameController,
                      labelText: 'Benutzername',
                      hintText: 'Gib einen Benutzername ein',
                      showInput: false,
                    ),
                    TextFormField(
                      controller: passwortController,
                      obscureText: _showInputPW,
                      onSaved: (val) => _password = val!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Passwort',
                        hintText: 'Gib dein Passwort ein',
                        suffixIcon: IconButton(
                          onPressed: () {
                            _togglePW();
                          },
                          icon: Icon(
                            _showInputPW
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: const Size(150, 60),
                      ),
                      onPressed: () {
                        print(benutzerNameController.text);
                        print(passwortController.text);
                      },
                      child: const Text('Einloggen'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey,
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/CreateUser');
                      },
                      child: const Text(
                        'Noch kein Konto? Jetzt registrieren',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
