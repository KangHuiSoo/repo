import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackForm());
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  int _rating = 0;
  double _sliderValue = 0;
  bool _agreeToTerms = false;
  String _successMessage = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _successMessage = 'Submission Complete';
      });
    } else {
      setState(() {
        _successMessage = 'Submission Failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('FeedBack Form'),
          backgroundColor: Colors.deepPurple,
        ),
        body: _designedFeedbackForm(),
      ),
    );
  }

  // 기본 디자인
  Widget _basicFeedbackForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Name';
                }
              },
              onSaved: (value) {
                setState(() {
                  _name = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                }
              },
              onSaved: (value) {
                setState(() {
                  _email = value!;
                });
              },
            ),
            ListTile(
              title: Text('How would rate our app?'),
              trailing: Text('$_rating'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(5, (index) {
                return Radio<int>(
                    value: index + 1,
                    groupValue: _rating,
                    onChanged: (value) {
                      setState(() {
                        _rating = value!;
                      });
                    });
              }),
            ),
            ListTile(
              title: Text('How satisfied are your with our customer service?'),
              trailing:
                  Text('${_sliderValue.toStringAsFixed(0)}'), // 소수점 1자리까지 반올림
            ),
            Slider(
                min: 0,
                max: 10,
                divisions: 10,
                label: _sliderValue.toStringAsFixed(0),
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value!;
                  });
                }),
            CheckboxListTile(
              title: Text('Subcribe to oure newsletter'),
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
            ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '$_successMessage',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _successMessage.contains('Complete')
                        ? Colors.blue
                        : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 퍼플테마 디자인
  Widget _designedFeedbackForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Heesoo Kang',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Name';
                }
              },
              onSaved: (value) {
                setState(() {
                  _name = value!;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'email@gmail.com',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                }
              },
              onSaved: (value) {
                setState(() {
                  _email = value!;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'tell your opinion',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Description';
                }
              },
              onSaved: (value) {
                setState(() {
                  _email = value!;
                });
              },
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('How would rate our app?',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Text('$_rating',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(5, (index) {
                return Radio<int>(
                    activeColor: Colors.deepPurple,
                    value: index + 1,
                    groupValue: _rating,
                    onChanged: (value) {
                      setState(() {
                        _rating = value!;
                      });
                    });
              }),
            ),
            ListTile(
              title: Text('How satisfied are your with our customer service?',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Text('${_sliderValue.toStringAsFixed(0)}',
                  style:
                      TextStyle(fontWeight: FontWeight.w600)), // 소수점 1자리까지 반올림
            ),
            Slider(
                activeColor: Colors.deepPurple,
                min: 0,
                max: 10,
                divisions: 10,
                label: _sliderValue.toStringAsFixed(0),
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value!;
                  });
                }),
            CheckboxListTile(
              activeColor: Colors.deepPurple,
              title: Text('Subcribe to oure newsletter',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '$_successMessage',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _successMessage.contains('Complete')
                        ? Colors.deepPurple
                        : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
