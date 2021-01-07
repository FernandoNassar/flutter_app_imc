import 'package:flutter/material.dart';

class FormInputBuilder extends StatelessWidget {
  final TextEditingController controller;
  final String errorMessage;
  final String labelText;
  final String hintText;
  
  FormInputBuilder({this.controller, this.errorMessage, this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white60, fontSize: 24.0),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white60)
        ),
        validator: (value) {
          if (value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
