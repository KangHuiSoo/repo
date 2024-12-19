import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

final futureProvider = FutureProvider<String>((ref) async{
  await Future.delayed(const Duration(seconds:2));
  return 'Loaded data!';
});