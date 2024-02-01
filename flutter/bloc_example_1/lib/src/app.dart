import 'package:bloc/bloc.dart';
import 'package:bloc_example_1/src/bloc/home.dart';
import 'package:bloc_example_1/src/cubit/count_cubit.dart';
import 'package:bloc_example_1/src/cubit/home.dart';
import 'package:bloc_example_1/src/getx/count_getx_controller.dart';
import 'package:bloc_example_1/src/getx/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/count_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더하기 예제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(
                    GetxHome(),
                    binding: BindingsBuilder(
                      () {
                        Get.put(CountGetxController());
                      },
                    ),
                    duration: Duration.zero,
                  );
                },
                child: Text('Getx 더하기')),
            ElevatedButton(
                onPressed: () {
                  Get.to(
                    BlocProvider(
                      create: (context) => CountCubit(),
                      child: CubitHome(),
                    ),
                    duration: Duration.zero,
                  );
                },
                child: Text('Cubit 더하기')),
            ElevatedButton(
                onPressed: () {
                  Get.to(
                    BlocProvider(
                      create: (context) => CountBloc(),
                      child: BlocHome(),
                    ),
                    duration: Duration.zero,
                  );
                },
                child: Text('Bloc 더하기')),
          ],
        ),
      ),
    );
  }
}
