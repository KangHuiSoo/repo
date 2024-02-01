import 'package:bloc_example_1/src/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc 상태관리'),
      ),
      body: Center(
        child: BlocBuilder<CountBloc,int>(builder: ((context, state) {
          return Text(
          state.toString(),
          style: TextStyle(fontSize: 80.0),
        );
        }))
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CountBloc>().add(AddCountEvent());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: (){
              context.read<CountBloc>().add(SubstractCount());
            },
            child: Text('-'),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );;
  }
}