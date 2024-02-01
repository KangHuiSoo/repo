import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0) {
    on<AddCountEvent>((event, emit) {
      emit(state + 1);
    });
    on<SubstractCount>((event, emit) {
      emit(state - 1);
    });
  }
}

abstract class CountEvent extends Equatable {}

class AddCountEvent extends CountEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SubstractCount extends CountEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}