//import 'package:dogcat/utill/dialog_box.dart';
//import 'package:flutter_t/utill/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_1/utill/dialog_box.dart';
import 'package:test_1/utill/todo_tile.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  State<DiaryScreen> createState() => DiaryScreenState();
}

class DiaryScreenState extends State<DiaryScreen>{

  //text controller
  final _controller= TextEditingController();


  List toDoList =[
   
  ];

  //DateTime focusedDay= DateTime.now();

  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] =!toDoList[index][1];
    });
  }

  //add new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
       builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
       }
      );
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),),

      body:ListView.builder(
            itemCount: toDoList.length,
            itemBuilder:(context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
               taskCompleted: toDoList[index][1],
                onChanged:(value) => checkBoxChanged(value,index),
                deleteFunction: (context) => deleteTask(index),);
            }, 
          ) 
    );

  }
}
