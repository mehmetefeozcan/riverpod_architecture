import 'package:riverpod_architecture/core/base/index.dart';
import 'package:riverpod_architecture/view/splash/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(splashProvider);

    return BaseView(
      onInit: () {},
      onPageBuilder: (context) => Scaffold(
        body: _buildBody(viewModel),
      ),
    );
  }

  Widget _buildBody(SplashViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            viewModel.getSplashData(),
          ),
        ),
      ],
    );
  }
}
