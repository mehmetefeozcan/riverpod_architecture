import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BaseView extends ConsumerStatefulWidget {
  const BaseView({
    super.key,
    this.onInit,
    this.dispose,
    required this.onPageBuilder,
  });

  final void Function()? onInit;
  final void Function()? dispose;
  final Widget Function(BuildContext context) onPageBuilder;

  @override
  ConsumerState<BaseView> createState() => _ConsumerState();
}

class _ConsumerState extends ConsumerState<BaseView> {
  late AppLifecycleListener lifeCycleListener;

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
  void initState() {
    AppLifecycleListener(onStateChange: _onLifeCycleChanged);

    widget.onInit != null ? widget.onInit!() : null;

    print("initState");
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose != null ? widget.dispose!() : null;
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context);
  }
}
