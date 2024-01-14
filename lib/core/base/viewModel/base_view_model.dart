import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;

  onChangeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  onInit();
}
