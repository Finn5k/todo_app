import 'package:flutter/material.dart';

class EingabeFeldUser extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool showInput;
  final TextEditingController controller;

  const EingabeFeldUser({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.showInput,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: true,
      obscureText: showInput,
      maxLength: 32,
      decoration: InputDecoration(
        labelText: '$labelText',
        hintText: '$hintText',
        counterText: '',
        border: OutlineInputBorder(),
      ),
    );
  }
}