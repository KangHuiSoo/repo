import 'package:bloc_example_1/src/getx/count_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxHome extends GetView<CountGetxController> {
  const GetxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getX 상태관리'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.value.toString(),
            style: TextStyle(fontSize: 80.0),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: controller.addCount,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: controller.substractCount,
            child: Text('-'),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
