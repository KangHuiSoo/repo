import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AppBarTextArea',
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
        actions: [
          Icon(Icons.abc, color: Colors.blue,)
        ],
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('111111')),
            Text('222222'),
          ],
        ));
  }
}
