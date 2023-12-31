
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  
  ToDoTile({super.key, 
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),)
          ],

        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
      
              //check box
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                ),
      
              //task name
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted 
                ? TextDecoration.lineThrough 
                : TextDecoration.none 
                ),),
            ],
          ),
          decoration: BoxDecoration(color: const Color.fromARGB(255, 204, 152, 213),
          borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}