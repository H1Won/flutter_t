import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_1/data/data.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data= Get.put(datacontroller());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                data.num.value += 1;
                print(data.num.value);
              },
              child: Image(image: AssetImage('assets/dd.png'))),
          Obx(
                  ()=>
                  Text(data.num.value.toString())
          ),
        ],

      ),
    );
  }
}
