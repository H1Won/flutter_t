import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:intl/date_symbol_data_http_request.dart';
import 'package:test_1/screens/mainscreen.dart';
import 'package:test_1/screens/secondScreen.dart';
import 'package:test_1/screens/thirdScreen.dart';
import 'package:intl/intl.dart';

void main() async{

  await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      getPages: [
        GetPage(name: '/second', page: () =>SecondScreen()),
        GetPage(name: '/third', page: ()=>ThirdScreen())
      ],
    );
  }
}

