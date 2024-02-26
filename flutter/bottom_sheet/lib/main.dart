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
          title: Text('Bottom Sheet'),
        ),
        body: BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return Container(
              color: Colors.amber,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title:Text('추가'),
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.remove),
                    title:Text('삭제'),
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },);
        },
      ),
    );
  }
}


