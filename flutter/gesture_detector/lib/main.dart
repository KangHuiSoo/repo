import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragGesture(),
    );
  }
}

class DragGesture extends StatefulWidget {
  const DragGesture({Key? key}) : super(key: key);

  @override
  State<DragGesture> createState() => _DragGestureState();
}

class _DragGestureState extends State<DragGesture> {
  double _top = 0;
  String _dragStatue = 'Drag the text vertical';

  void _onVerticalDrageStart(DragStartDetails details) {
    setState(() {
      _dragStatue = 'Vertical drag started';
      _top = details.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details){
    setState(() {
      _top += details.delta.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag'),
      ),
      body: GestureDetector(
        onVerticalDragStart: _onVerticalDrageStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: _top,
                child: Text(_dragStatue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Demo"),
      ),
      body: GestureDetector(
        onTap: () {
          print('Screen tapped');
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text('Tap anywhere on the screen'),
          ),
        ),
      ),
    );
  }
}
