import 'package:riverpod_architecture/view/splash/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = ChangeNotifierProvider(
  (ref) => SplashViewModel(),
);
