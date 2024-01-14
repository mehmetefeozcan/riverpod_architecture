import 'package:riverpod_architecture/view/splash/index.dart';
import 'package:riverpod_architecture/core/enums/index.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static GoRouter routes = GoRouter(
    initialLocation: NavigationEnums.splash.toPath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: NavigationEnums.splash.toPath,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
