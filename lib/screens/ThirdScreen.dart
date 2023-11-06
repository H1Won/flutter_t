import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
        ],
      ),
    );
  }
}
