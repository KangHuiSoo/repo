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
            title: Text('Grid View'),
          ),
          body: GridView.builder(
            // scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemBuilder: (context, index){
              return Container(
                color: Colors.blueGrey,
                child: Center(
                  child: Text('item ${index + 1}'),
                ),
              );
            },
          )),
    );
  }
}
