import 'package:riverpod_architecture/presentation/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: userAsyncValue.when(
        data: (user) {
          return Center(
            child: Text('User ID: ${user.id}, Name: ${user.name}'),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
