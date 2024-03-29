import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("alert dialog"),
        ),
        body: Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        barrierDismissible: true,   //외부영역 터치시 닫힘 허용
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.all(14),
          actionsPadding: EdgeInsets.all(7),
          titlePadding: EdgeInsets.all(12),
          buttonPadding: EdgeInsets.all(10),
          backgroundColor: Colors.grey[400],
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          title: Text('AlertDialog Title'),
          content: Text('AlertDialog Description'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      ),
      child: Text('Show Dialog'),
    );
  }
}
