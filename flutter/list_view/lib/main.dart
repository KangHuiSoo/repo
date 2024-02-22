import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _listViewBasic(),
      ),
    );
  }

  //ListView 기본 - ListTile 사용
  Widget _listViewBasic() {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text('1'),
          ),
          title: Text('Item1'),
          subtitle: Text('Item description'),
          trailing: Icon(Icons.more_vert),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text('2'),
          ),
          title: Text('Item2'),
          subtitle: Text('Item description'),
          trailing: Icon(Icons.more_vert),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text('3'),
          ),
          title: Text('Item3'),
          subtitle: Text('Item description'),
          trailing: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

