import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BaseView extends ConsumerStatefulWidget {
  const BaseView({
    super.key,
    this.onInit,
    required this.onPageBuilder,
  });

  final void Function()? onInit;
  final Widget Function(BuildContext context) onPageBuilder;

  @override
  ConsumerState<BaseView> createState() => _ConsumerState();
}

class _ConsumerState extends ConsumerState<BaseView> {
  @override
  void initState() {
    widget.onInit != null ? widget.onInit!() : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context);
  }
}
