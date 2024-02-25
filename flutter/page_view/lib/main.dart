import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page Viw'),
        ),
        body: PageView(
          controller: PageController(initialPage: 1, viewportFraction: 0.9),
          children: [
            Container(margin: EdgeInsets.all(10), color: Colors.red,),
            Container(margin: EdgeInsets.all(10), color: Colors.blue,),
            Container(margin: EdgeInsets.all(10), color: Colors.yellow,),
          ],
        ),
      ),
    );
  }
}

