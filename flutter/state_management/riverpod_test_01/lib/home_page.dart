import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // counterProvider의 상태를 읽기
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 상태 업데이트
                ref.read(counterProvider.notifier).state++;
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}