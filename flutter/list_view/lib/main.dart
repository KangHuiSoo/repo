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
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: _listViewBuilder(),
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


  //ListView.builder 사용 예제
  Widget _listViewBuilder(){
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item$index'),
          subtitle: Text('list_view item $index'),
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(index.toString()),
          ),
        );
      },
    );
  }

}
