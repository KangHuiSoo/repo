import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();  //텍스트 필드에 입력된 값을 가져오기 위해 사용하는 컨트롤러

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Field Test'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'enter your Email',
                labelStyle: TextStyle(color: Colors.amber),
                hintStyle: TextStyle(color: Colors.brown),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 2, color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
                // enabled: false,
                icon: Icon(Icons.search),
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(Icons.add_a_photo),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.search,
              // obscureText: true, // 텍스트 입력시 ***로 표기 ( 비밀번호 형식 )
              controller: _emailController,  //텍스트 필드에 입력된 값을 가져오기 위해 사용하는 컨트롤러
            ),
            ElevatedButton(onPressed: () {
              print(_emailController.text);
            }, child: Text('Click')),
          ],
        ),
      ),
    );
  }
}
