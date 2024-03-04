import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Demo"),
      ),
      body: GestureDetector(
        onTap: (){
          print('Screen tapped');
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text('Tap anywhere on the screen'),
          ),
        ),
      ),
    );
  }
}
