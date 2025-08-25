import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget {
  final String titel;

  const TopNavbar({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titel,
        style: TextStyle(color: Colors.blue,
            fontWeight: FontWeight.bold,
          fontSize: 44
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/CreateTask');
        }, child: Text('Erstellen'))
      ],
    );
  }
}
