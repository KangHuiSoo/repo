import 'package:bloc_state_practice1/src/bloc/count_bloc.dart';
import 'package:bloc_state_practice1/src/screen/bloc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(
                      BlocProvider(
                        create: (context) => CountBloc(),
                        child: BlocScreen(),
                      ),
                      duration: Duration.zero);
                },
                child: Text('bloc test'))
          ],
        ),
      ),
    );
  }
}
