import 'package:flutter/material.dart';
import 'package:test_1/utill/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "할 일을 적어주세요.",),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
              
            children: [
              //save
              MyButton(text: "Save", onPressed: onSave),
              
              const SizedBox(width: 8),

              //cancel
              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          )


        ]),),
    );
  }
}