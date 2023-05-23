import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.abc))
              ],
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _MyAppBar(){
  return AppBar(
    elevation: 1,
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_outlined),
        color: Colors.black,
        onPressed: () {},
      )
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '             AppBar Title',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down), color: Colors.grey,)
      ],
    ),
  );
}




