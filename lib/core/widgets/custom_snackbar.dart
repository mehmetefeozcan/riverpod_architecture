import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required bool error,
  required String text,
}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    duration: const Duration(seconds: 2),
  );
}
