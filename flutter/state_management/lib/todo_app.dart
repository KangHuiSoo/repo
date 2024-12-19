import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_02/todo.dart';
import 'package:riverpod_test_02/todo_notifier.dart';


final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());

// 4. UI 구성
// 할 일 리스트와 추가/수정/삭제 기능을 보여주는 UI
class TodoApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // (4-1) 상태 읽기: 현재 할 일 리스트를 구독
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Todo App with Riverpod")),
      body: ListView.builder(
        // (4-2) 상태를 기반으로 할 일 리스트 렌더링
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todo.title,
              // (4-3) 완료된 항목은 텍스트에 취소선을 추가
              style: TextStyle(
                decoration: todo.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            // (4-4) 완료 상태를 토글하는 버튼
            trailing: IconButton(
              icon: Icon(todo.isCompleted
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              onPressed: () => ref.read(todoProvider.notifier).toggleTodo(todo.id),
            ),
            // (4-5) 항목을 길게 누르면 삭제
            onLongPress: () =>
                ref.read(todoProvider.notifier).removeTodo(todo.id),
          );
        },
      ),
      // (4-6) 할 일 추가를 위한 FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // (4-6-1) 사용자 입력을 받기 위한 다이얼로그 표시
          final title = await showDialog<String>(
            context: context,
            builder: (context) {
              String input = ''; // 입력값을 저장
              return AlertDialog(
                title: Text("Add Todo"),
                content: TextField(
                  onChanged: (value) => input = value, // 입력값을 실시간으로 업데이트
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), // 다이얼로그 닫기
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(input), // 입력값 반환
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );

          // (4-6-2) 입력값이 비어있지 않을 경우 상태 업데이트
          if (title != null && title.isNotEmpty) {
            ref.read(todoProvider.notifier).addTodo(title);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}