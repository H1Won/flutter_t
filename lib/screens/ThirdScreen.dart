import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_1/utill/dialog_box.dart';
import 'package:test_1/utill/todo_tile.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  State<ThirdScreen> createState()=> ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen>{

  //text controller
  final _controller= TextEditingController();


  List toDoList =[
    ["doing something",false],
    ["eat something", false]
    
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
          onCancel: () => Navigator.of(context).pop()
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
      body: Column(
        children: [
          TableCalendar(
              locale: 'ko-KR',
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2021,10,16),
              lastDay: DateTime.utc(2030,3,14),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          )),
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder:(context, index) {
                return ToDoTile(
                  taskName: toDoList[index][0],
                 taskCompleted: toDoList[index][1],
                  onChanged:(value) => checkBoxChanged(value,index),
                  deleteFunction: (context) => deleteTask(index),);
              }, 
            ),
          ) 
        ],
      ),
    );
  }
}
