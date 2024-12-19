import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_02/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    state = [...state, newTodo];
  }

  void toggleTodo(String id) {
    state = state
        .map((todo) => todo.id == id ? todo.toggleCompleted() : todo)
        .toList();
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
