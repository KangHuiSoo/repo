import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flutter_riverpod.dart';



class NotifierPage extends ConsumerWidget {
  const NotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifier Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () =>
                      ref.read(counterNotifierProvider.notifier).decrement(),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () =>
                      ref.read(counterNotifierProvider.notifier).increment(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}