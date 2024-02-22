import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _errorMessage = '';
      });
    } else {
      setState(() {
        _errorMessage = 'Please fill all fields';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null; // 유효성검사 통과시 null을 리턴
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null; // 유효성검사 통과시 null을 리턴
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null; // 유효성검사 통과시 null을 리턴
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Submit'),
                  ),
                  Text(
                    '$_errorMessage',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
