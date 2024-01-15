import 'package:riverpod_architecture/core/base/index.dart';
import 'package:riverpod_architecture/view/splash/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  void _onLifeCycleChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print("detached");
      case AppLifecycleState.resumed:
        print("resumed");
      case AppLifecycleState.inactive:
        print("inactive");
      case AppLifecycleState.hidden:
        print("hidden");
      case AppLifecycleState.paused:
        print("paused");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(splashProvider);

    return BaseView(
      onInit: () {},
      dispose: () {},
      onPageBuilder: (context) => Scaffold(body: _buildBody(viewModel)),
    );
  }

  Widget _buildBody(SplashViewModel viewModel) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            viewModel.counter.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.increment();
            },
            child: Text("Arttır"),
          )
        ],
      ),
    );
  }
}
