import 'package:riverpod_architecture/core/base/index.dart';

class SplashViewModel extends BaseViewModel {
  int counter = 0;

  @override
  onInit() {}

  void increment() {
    counter++;
    notifyListeners();
  }
}
