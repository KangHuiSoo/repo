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
  bool _checkBoxValue = false;
  String _radioValue = 'option1';
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Controls Example'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('$_checkBoxValue'),
                ),
                SizedBox(height: 8),
                Text('Check Box'),
                Checkbox(
                  value: _checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Radio(
                        value: 'option1',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        }),
                    Text('option1'),
                    Radio(
                        value: 'option2',
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value!;
                          });
                        }),
                    Text('option2'),
                  ],
                ),
                Slider(
                  min: 0,
                  max: 100,
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
