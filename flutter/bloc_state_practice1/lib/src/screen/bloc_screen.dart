import 'package:bloc_state_practice1/src/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CountBloc>().add(AddCountEvent());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CountBloc>().add(SubstractCount());
            },
            child: Text('-'),
          ),
        ],
      ),
      body: Container(
        child: BlocBuilder<CountBloc, int>(builder: ((context, state) {
          return Center(
            child: Text(
              state.toString(),
              style: TextStyle(fontSize: 30),
            ),
          );
        })),
      ),
    );
  }
}
