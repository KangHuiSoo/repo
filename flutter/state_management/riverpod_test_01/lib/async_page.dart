import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flutter_riverpod.dart';

class AsyncPage extends ConsumerWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Async Example')),
      body: Center(
        child: asyncValue.when(
            data: (data) => Text(data),
            error: (error,stack) => Text('Error: $error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
