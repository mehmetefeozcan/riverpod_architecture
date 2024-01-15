import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool isLoading = false;

  onChangeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
