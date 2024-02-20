import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.purpleAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/coding.gif'),
                  radius: 100,
                ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       image: DecorationImage(
                //           image: AssetImage('assets/images/coding.gif'),
                //           fit: BoxFit.cover)),
                // ),
                SizedBox(height: 10.0),
                Text(
                  "Song Title",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Artist Name",
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Slider(
              value: 0.1,
              onChanged: (value) {},
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.skip_previous, size: 50, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow, size: 50, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next, size: 50, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
