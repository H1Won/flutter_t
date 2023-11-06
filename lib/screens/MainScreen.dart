
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
          ),

          GestureDetector(
            onTap: () {
              Get.toNamed('/third');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          )
          ,
          Row(
            children: [

              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),GestureDetector(
                onTap: () => (
                    Get.toNamed('/second')
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          )],

      ),

    );
  }
}
